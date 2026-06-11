
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/api/api_consumer.dart';
import 'package:lostandfound/core/api/end_points.dart';
import 'package:lostandfound/core/error/exception.dart';
import 'package:lostandfound/core/function/imagepick.dart';
import 'package:lostandfound/core/services/get_it_services.dart';
import 'package:lostandfound/features/home/view/done.dart';
import 'package:lostandfound/features/report/model/categories.dart';
import 'package:lostandfound/features/report/model/locationModel.dart';

class ReportFoundController extends GetxController {
  final ApiConsumer api = getIt<ApiConsumer>();

  /// Categories Response
  CategoriesResponse? categoriesResponse;

  /// Categories List
  List<Category> categories = [];

  /// Locations List
  List<LocationModel> locations = [];

  /// Selected Category Id
  int? selectedCategoryId;

  /// Selected Location Id
  int? selectedLocationId;

  /// Selected Image
  File? file;

  /// Form Key
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  /// Text Controllers
  late TextEditingController nameController;
  late TextEditingController brandController;
  late TextEditingController descController;
  late TextEditingController dateController;
  late TextEditingController timeController;

  /// Category Dropdown Items
  List<DropdownMenuItem<int>> get categoryItems {
    return categories.map((category) {
      return DropdownMenuItem<int>(
        value: category.id,
        child: Text(category.name),
      );
    }).toList();
  }

  /// Location Dropdown Items
  List<DropdownMenuItem<int>> get locationItems {
    return locations.map((location) {
      return DropdownMenuItem<int>(
        value: location.id,
        child: Text(location.name),
      );
    }).toList();
  }

  @override
  void onInit() {
    super.onInit();

    nameController = TextEditingController();
    brandController = TextEditingController();
    descController = TextEditingController();
    dateController = TextEditingController();
    timeController = TextEditingController();

    getCategories();
    getLocations();
  }

  @override
  void onClose() {
    nameController.dispose();
    brandController.dispose();
    descController.dispose();
    dateController.dispose();
    timeController.dispose();

    super.onClose();
  }

  /// Get Categories
  Future<void> getCategories() async {
    try {
      final response = await api.get(EndPoint.categories);

      categoriesResponse = CategoriesResponse.fromJson(response);

      categories = categoriesResponse!.data;

      update();
    } on ServerException catch (e) {
      Get.snackbar(
        "Error",
        e.erorrModel.erorrmessage,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );
    }
  }

  /// Get Locations
  Future<void> getLocations() async {
    try {
      final response = await api.get(EndPoint.locations);

      final locationsResponse = LocationsResponse.fromJson(response);

      locations = locationsResponse.data;

      update();
    } on ServerException catch (e) {
      Get.snackbar(
        "Error",
        e.erorrModel.erorrmessage,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );
    }
  }

  /// Change Category
  void changeCategory(int? value) {
    selectedCategoryId = value;
    update();
  }

  /// Change Location
  void changeLocation(int? value) {
    selectedLocationId = value;
    update();
  }

  /// Pick Image
  Future<void> pickImage() async {
    file = await MyImagePicker();
    update();
  }

  /// Submit Form
Future<void> submitReport() async {
  if (!formstate.currentState!.validate()) {
    return;
  }

  try {
    await api.post(
      EndPoint.reports,
      isFromData: true,
      data: {
        "ReportType": 0,
        "ItemName": nameController.text.trim(),
        "ConditionType": 1,
        "DateReported": DateTime.now().toIso8601String(),

        // Optional Fields
        "Color": brandController.text.trim().isEmpty
            ? null
            : brandController.text.trim(),

        "Description": descController.text.trim().isEmpty
            ? null
            : descController.text.trim(),

        "LocationId": selectedLocationId,

        "CategoryId": selectedCategoryId,

        "Images": file != null
            ? [
                await uploadImageToAPI(file!),
              ]
            : [],
      },
    );

    Get.offAll(
      () => DonePage(
        text: "report received for review".tr,
      ),
    );
  } on ServerException catch (e) {
    Get.snackbar(
      "Error",
      e.erorrModel.erorrmessage,
    );
  } catch (e) {
    Get.snackbar(
      "Error",
      e.toString(),
    );
  }
}

}

