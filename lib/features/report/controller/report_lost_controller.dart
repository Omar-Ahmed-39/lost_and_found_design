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

class ReportLostController extends GetxController {
  final ApiConsumer api = getIt<ApiConsumer>();

  CategoriesResponse? categoriesResponse;

  List<Category> categories = [];

  List<LocationModel> locations = [];

  int? selectedCategoryId;

  int? selectedLocationId;

List<File> files = [];
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController brandController;
  late TextEditingController descController;
  late TextEditingController dateController;
  late TextEditingController timeController;

  List<DropdownMenuItem<int>> get categoryItems {
    return categories.map((category) {
      return DropdownMenuItem<int>(
        value: category.id,
        child: Text(category.name),
      );
    }).toList();
  }

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

  void changeCategory(int? value) {
    selectedCategoryId = value;
    update();
  }

  void changeLocation(int? value) {
    selectedLocationId = value;
    update();
  }

  Future<void> pickImages() async {
  files = await MyMultiImagePicker();
  update();
}

  Future<void> submitReport() async {
    if (!formstate.currentState!.validate()) {
      return;
    }

    try {
      await api.post(
        EndPoint.reports,
        isFromData: true,
        data: {
          "ReportType": 1,
          "ItemName": nameController.text.trim(),
          "ConditionType": 1,
          "DateReported": DateTime.now().toIso8601String(),

          "Color": brandController.text.trim().isEmpty
              ? null
              : brandController.text.trim(),

          "Description": descController.text.trim().isEmpty
              ? null
              : descController.text.trim(),

          "LocationId": selectedLocationId,

          "CategoryId": selectedCategoryId,

          "Images": files.isNotEmpty
    ? await Future.wait(
        files.map(
          (file) => uploadImageToAPI(file),
        ),
      )
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