import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/api/api_consumer.dart';
import 'package:lostandfound/core/api/end_points.dart';
import 'package:lostandfound/core/error/exception.dart';
import 'package:lostandfound/core/services/get_it_services.dart';

class ChangPasswordController extends GetxController {
  ApiConsumer api = getIt<ApiConsumer>();
  
  late TextEditingController currentPasswordController; // تم تصحيح الإملاء هنا
  late TextEditingController newPasswordController;
  
  // مفتاح التحقق من الفورم
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    super.onClose();
  }

  Future<void> changePassword() async {
    // التحقق من صحة المدخلات قبل إرسال الطلب للسيرفر
    if (!formKey.currentState!.validate()) {
      return; // توقف لو كانت المدخلات غير صحيحة
    }

    try {
      await api.put(
        EndPoint.changePassword,
        data: {
          "currentPassword": currentPasswordController.text.trim(),
          "newPassword": newPasswordController.text.trim()
        },
      );
      Get.back();
      Get.snackbar("success".tr, "change password is done".tr);
    } on ServerException catch (e) {

      
      Get.snackbar(
        "error".tr,
        e.erorrModel.erorrmessage,
        animationDuration: const Duration(seconds: 3),
      );
    }
  }
}