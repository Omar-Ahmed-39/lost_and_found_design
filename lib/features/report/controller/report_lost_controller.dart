import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/function/imagepick.dart';
import 'package:lostandfound/features/home/view/done.dart';

class ReportLostController extends GetxController {
  // مفتاح التحقق من النموذج
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  // متغيرات حفظ الحالة والبيانات
  String? selectedCategory;
  String? selectedCategory1;
  File? file;

  // تعريف متحكمات حقول النصوص
  late TextEditingController nameController;
  late TextEditingController brandController;
  late TextEditingController descController;
  late TextEditingController dateController;
  late TextEditingController timeController;

  // القائمة المنسدلة للتصنيفات
  final List<DropdownMenuItem<String>> items = [
    DropdownMenuItem(value: "electronics", child: Text("electronics".tr)),
    DropdownMenuItem(value: "wallet", child: Text("wallet".tr)),
    DropdownMenuItem(value: "keys", child: Text("keys".tr)),
    DropdownMenuItem(value: "bag", child: Text("bag".tr)),
    DropdownMenuItem(value: "other", child: Text("other".tr)),
  ];

  // القائمة المنسدلة للمواقع
  final List<DropdownMenuItem<String>> items1 = [
    DropdownMenuItem(value: "campus yard", child: Text("campus yard".tr)),
    DropdownMenuItem(value: "hall", child: Text("hall".tr)),
    DropdownMenuItem(value: "prayer room", child: Text("prayer room".tr)),
    DropdownMenuItem(value: "other", child: Text("other".tr)),
  ];

  @override
  void onInit() {
    // تهيئة حقول النصوص عند تشغيل الصفحة
    nameController = TextEditingController();
    brandController = TextEditingController();
    descController = TextEditingController();
    dateController = TextEditingController();
    timeController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // إغلاق حقول النصوص لتفريغ الذاكرة فور مغادرة الصفحة
    nameController.dispose();
    brandController.dispose();
    descController.dispose();
    dateController.dispose();
    timeController.dispose();
    super.onClose();
  }

  // تغيير قيمة التصنيف المحدد وتحديث الواجهة
  void changeCategory(String value) {
    selectedCategory = value;
    update();
  }

  // تغيير قيمة الموقع المحدد وتحديث الواجهة
  void changeLocation(String value) {
    selectedCategory1 = value;
    update();
  }

  // التقاط واختيار الصورة وتحديث الوجت الخاص بها
  void pickImage() async {
    file = await MyImagePicker();
    update();
  }

  // التحقق من الحقول وإرسال البلاغ
  void handleSend() {
    if (formstate.currentState!.validate()) {
      // الانتقال باستخدام GetX وحذف الصفحات السابقة من الـ Stack
      Get.offAll(() => DonePage(
            text: "report received for review".tr,
          ));
    }
  }
}