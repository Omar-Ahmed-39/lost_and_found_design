import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/api/api_consumer.dart';
import 'package:lostandfound/core/api/dio_consumer.dart';
import 'package:lostandfound/core/api/end_points.dart';
import 'package:lostandfound/core/database/cache/cache_helper.dart';
import 'package:lostandfound/core/error/exception.dart';
import 'package:lostandfound/model/signin_model.dart';

class SinginController extends GetxController {
 late GlobalKey<FormState> formstate;
  late TextEditingController emailController;
  late TextEditingController passwordController;
   bool obscure =true;

  bool isloading = false;
  SignInModel? user;

  ApiConsumer api = DioConsumer(dio: Dio());
  void changeObscure(){
    obscure=!obscure;
    update();
  }
  Future signDio() async {
    if (formstate.currentState!.validate()) {
  isloading = true;
  update();
  try {
    var responce = await api.post(
      EndPoint.signIn,
      data: {ApiKey.email: emailController.text.trim(), ApiKey.password: passwordController.text.trim()},
    );
    SignInModel user = SignInModel.fromJson(responce);
    CacheHelper.saveData(key: "token", value: user.dataSignin.token);
    Get.offAllNamed("/");
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
 formstate = GlobalKey();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }
  @override
  void onClose() {
       emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
