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

class ReportFoundController extends GetxController {
  final ApiConsumer api = getIt<ApiConsumer>();

  /// الاستجابة كاملة من الـ API
  CategoriesResponse? categoriesResponse;

  /// الفئات فقط
  List<Category> categories = [];

  /// الفئة المختارة (نخزن الـ id)
  int? selectedCategoryId;

  /// الموقع المختار
  String? selectedLocation;

  /// الصورة المختارة
  File? file;

  /// مفتاح الفورم
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  /// Controllers
  late TextEditingController nameController;
  late TextEditingController brandController;
  late TextEditingController descController;
  late TextEditingController dateController;
  late TextEditingController timeController;

  /// قائمة المواقع الثابتة
  final List<DropdownMenuItem<String>> locationItems = [
    DropdownMenuItem(
      value: "campus yard",
      child: Text("campus yard".tr),
    ),
    DropdownMenuItem(
      value: "hall",
      child: Text("hall".tr),
    ),
    DropdownMenuItem(
      value: "prayer room",
      child: Text("prayer room".tr),
    ),
    DropdownMenuItem(
      value: "other",
      child: Text("other".tr),
    ),
  ];

  /// عناصر الفئات الديناميكية
  List<DropdownMenuItem<int>> get categoryItems {
    return categories.map((category) {
      return DropdownMenuItem<int>(
        value: category.id,
        child: Text(category.name),
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

  /// جلب الفئات
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

  /// تغيير الفئة
  void changeCategory(int? value) {
    selectedCategoryId = value;
    update();
  }

  /// تغيير الموقع
  void changeLocation(String? value) {
    selectedLocation = value;
    update();
  }

  /// اختيار صورة
  Future<void> pickImage() async {
    file = await MyImagePicker();
    update();
  }

  /// إرسال التقرير
  void handleSend() {
    if (formstate.currentState!.validate()) {
      /// هنا تستطيع إرسال البيانات إلى الـ API
      print("Category Id: $selectedCategoryId");
      print("Location: $selectedLocation");

      Get.offAll(
        () => DonePage(
          text: "report received for review".tr,
        ),
      );
    }
  }
}