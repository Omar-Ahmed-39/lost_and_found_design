import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/api/api_consumer.dart';
import 'package:lostandfound/core/api/dio_consumer.dart';
import 'package:lostandfound/core/api/end_points.dart';
import 'package:lostandfound/core/database/cache/cache_helper.dart';
import 'package:lostandfound/core/error/exception.dart';
import 'package:lostandfound/core/services/get_it_services.dart';
import 'package:lostandfound/features/auth/model/signin_model.dart';
import 'package:lostandfound/features/profile/model/profile_model.dart';

class SinginController extends GetxController {
 late GlobalKey<FormState> formstate;
  late TextEditingController emailController;
  late TextEditingController passwordController;
   bool obscure =true;

  bool isloading = false;
  SignInModel? user;

  ApiConsumer api =getIt<ApiConsumer>();
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
    CacheHelper.saveData(key: "refreshToken", value: user.dataSignin.refreshToken);
    var responceforProfile = await api.get(
      EndPoint.profile,
    );
    ProfileResponse profileResponse=ProfileResponse.fromJson(responceforProfile);
    CacheHelper.saveData(key: "name", value: profileResponse.data!.name);
    CacheHelper.saveData(key: "email", value: profileResponse.data!.email);
    CacheHelper.saveData(key: "avatarUrl", value: profileResponse.data!.avatarUrl);



    Get.offAllNamed("/HomeScreen");
  } on ServerException catch (e) {
    isloading=false;
    update();
    Get.snackbar(e.erorrModel.title, e.erorrModel.erorrmessage,  animationDuration: Duration(seconds: 3)
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
