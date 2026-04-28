import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/api/api_consumer.dart';
import 'package:lostandfound/core/api/dio_consumer.dart';
import 'package:lostandfound/core/api/end_points.dart';
import 'package:lostandfound/core/database/cache/cache_helper.dart';
import 'package:lostandfound/core/error/exception.dart';
import 'package:lostandfound/model/signin_model.dart';

class SignupController extends GetxController {
   late GlobalKey<FormState> formstate;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
   bool obscure =true;

  bool isloading = false;

  ApiConsumer api = DioConsumer(dio: Dio());
  void changeObscure(){
    obscure=!obscure;
    update();
  }
  Future signupDio() async {
    if (formstate.currentState!.validate()) {
  isloading = true;
  update();
  try {
    var responce = await api.post(
      EndPoint.signUp,
 data: {
            ApiKey.name: nameController.text.trim(),
            ApiKey.email: emailController.text.trim(),
            ApiKey.password: passwordController.text.trim(),
            ApiKey.phone: phoneController.text.trim(),
          },    );
   
    Get.back( );
    Get.snackbar(
      
  "نجاح", 
  "تم إنشاء الحساب ، الرجاء تسجيل الدخول",
  animationDuration: Duration(seconds: 3)
);
  } on ServerException catch (e) {
    isloading=false;
    update();
    Get.snackbar("خطأ", e.erorrModel.erorrmessage,  animationDuration: Duration(seconds: 3)
);
  }
}
  }
  @override
  void onInit() {
    formstate = GlobalKey<FormState>();

    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();

    super.onClose();
  }
}
