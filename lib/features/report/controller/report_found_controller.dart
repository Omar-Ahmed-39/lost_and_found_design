import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/api/api_consumer.dart';
import 'package:lostandfound/core/api/end_points.dart';
import 'package:lostandfound/core/error/exception.dart';
import 'package:lostandfound/core/function/imagepick.dart';
import 'package:lostandfound/core/services/get_it_services.dart';
import 'package:lostandfound/features/home/view/done.dart';

class ReportFoundController extends GetxController {

    ApiConsumer api =getIt<ApiConsumer>();

  // مفتاح النموذج
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  // المتغيرات الخاصة بالحالة
  String? selectedCategory;
  String? selectedCategory1;
  File? file;

  // تعريف متحكمات النصوص
  late TextEditingController nameController;
  late TextEditingController brandController;
  late TextEditingController descController;
  late TextEditingController dateController;
  late TextEditingController timeController;

  // القوائم المنسدلة
  final List<DropdownMenuItem<String>> items = [
    DropdownMenuItem(value: "electronics", child: Text("electronics".tr)),
    DropdownMenuItem(value: "wallet", child: Text("wallet".tr)),
    DropdownMenuItem(value: "keys", child: Text("keys".tr)),
    DropdownMenuItem(value: "bag", child: Text("bag".tr)),
    DropdownMenuItem(value: "other", child: Text("other".tr)),
  ];

  final List<DropdownMenuItem<String>> items1 = [
    DropdownMenuItem(value: "campus yard", child: Text("campus yard".tr)),
    DropdownMenuItem(value: "hall", child: Text("hall".tr)),
    DropdownMenuItem(value: "prayer room", child: Text("prayer room".tr)),
    DropdownMenuItem(value: "other", child: Text("other".tr)),
  ];

  @override
  void onInit() {
    // تهيئة المتحكمات عند بدء الكنترولر
    nameController = TextEditingController();
    brandController = TextEditingController();
    descController = TextEditingController();
    dateController = TextEditingController();
    timeController = TextEditingController();
    super.onInit();
        getCategories();

  }

  @override
  void onClose() {
    // تفريغ الذاكرة عند إغلاق الصفحة
    nameController.dispose();
    brandController.dispose();
    descController.dispose();
    dateController.dispose();
    timeController.dispose();
    super.onClose();
  }
  void getCategories()async{
   try {
  var response= await api.get(EndPoint.categories);
  print("PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP");
  print(response);
} on ServerException catch (e) {
  // TODO
}
  }

  // تغيير فئة التصنيف
  void changeCategory(String value) {
    selectedCategory = value;
    update(); // لتحديث الوجت المرتبطة بـ GetBuilder
  }

  // تغيير الموقع
  void changeLocation(String value) {
    selectedCategory1 = value;
    update();
  }

  // اختيار الصورة
  void pickImage() async {
    file = await MyImagePicker();
    update();
  }

  // إرسال البيانات والتحقق من الصلاحية
  void handleSend() {
    if (formstate.currentState!.validate()) {
      // استخدام انتقال GetX بدلاً من الـ Navigator التقليدي
      Get.offAll(() => DonePage(
            text: "report received for review".tr,
          ));
    }
  }
}