import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/api/api_consumer.dart';
import 'package:lostandfound/core/api/dio_consumer.dart';
import 'package:lostandfound/core/api/end_points.dart';
import 'package:lostandfound/core/database/cache/cache_helper.dart';
import 'package:lostandfound/core/error/exception.dart';
import 'package:lostandfound/core/function/imagepick.dart';
import 'package:lostandfound/core/local/local_controller.dart';
import 'package:lostandfound/core/services/get_it_services.dart';
import 'package:lostandfound/features/profile/model/profile_model.dart';

class ProfileController extends GetxController {
  ApiConsumer api =getIt<ApiConsumer>();
  File? file;
  Future<void> logout() async {
    try {
      await api.post(EndPoint.logout);
      CacheHelper.clearData();
       Get.offAllNamed("/");
    } on ServerException catch (e) {
      Get.snackbar(
        e.erorrModel.title,
        e.erorrModel.erorrmessage,
        animationDuration: Duration(seconds: 3),
      );
    }
  }
  Future<void> updateImageProfile() async {
  try {
  final img = await MyImagePicker();
  
  if (img == null) return;
  
  final imageFile = await uploadImageToAPI(img);
  
 final responceforProfile= await api.put(
    EndPoint.profile,
    isFromData: true,
    data: {
    "name": CacheHelper.getData(key: "name"),
    "email": CacheHelper.getData(key: "email"),
    "profileImage": imageFile
  },
  );
   ProfileResponse profileResponse=ProfileResponse.fromJson(responceforProfile);
    CacheHelper.saveData(key: "name", value: profileResponse.data!.name);
    CacheHelper.saveData(key: "email", value: profileResponse.data!.email);
    CacheHelper.saveData(key: "avatarUrl", value: profileResponse.data!.avatarUrl);

  update();
}  on ServerException catch (e) {
      Get.snackbar(
        e.erorrModel.title,
        e.erorrModel.erorrmessage,
        animationDuration: Duration(seconds: 3),
      );
    }
}
Future<void> pickImage() async {
    file = await MyImagePicker();
    update();
  }

Future<void> updateProfile({
  required String name,
  required String email,
}) async {



  try {
  
    
      final img= await  uploadImageToAPI(file!);
    
    final response = await api.put(
      EndPoint.profile,
      isFromData: true,
      data: {
        "name": name,
        "email": email,
        "profileImage":img
      },
    );

    final profile =
        ProfileResponse.fromJson(response);

    CacheHelper.saveData(
      key: "name",
      value: profile.data?.name,
    );

    CacheHelper.saveData(
      key: "email",
      value: profile.data?.email,
    );

    CacheHelper.saveData(
      key: "avatarUrl",
      value: profile.data?.avatarUrl,
    );

    update();

    Get.snackbar(
      "Success",
      "Profile updated successfully",
    );
  } on ServerException catch (e) {
    Get.snackbar(
      e.erorrModel.title,
      e.erorrModel.erorrmessage,
    );
  }
}



  @override
  void onInit() {
        Get.lazyPut<MyLocalController>(() => MyLocalController());

    // TODO: implement onInit
    super.onInit();
  }
}
