import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/api/api_consumer.dart';
import 'package:lostandfound/core/api/dio_consumer.dart';
import 'package:lostandfound/core/api/end_points.dart';
import 'package:lostandfound/core/database/cache/cache_helper.dart';
import 'package:lostandfound/core/error/exception.dart';
import 'package:lostandfound/core/local/local_controller.dart';
import 'package:lostandfound/core/services/get_it_services.dart';

class ProfileController extends GetxController {
  ApiConsumer api =getIt<ApiConsumer>();
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

  Future<void> changePassword() async {
    try {
      await api.post(EndPoint.changePassword,
      data: {
         "currentPassword": "string",
          "newPassword": "stringst"
      });
      
    } on ServerException catch (e) {
      Get.snackbar(
        e.erorrModel.title,
        e.erorrModel.erorrmessage,
        animationDuration: Duration(seconds: 3),
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
