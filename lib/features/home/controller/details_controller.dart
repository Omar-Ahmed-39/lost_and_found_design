import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/api/api_consumer.dart';
import 'package:lostandfound/core/api/dio_consumer.dart';
import 'package:lostandfound/core/api/end_points.dart';
import 'package:lostandfound/core/error/exception.dart';
import 'package:lostandfound/core/services/get_it_services.dart';
import 'package:lostandfound/features/home/view/done.dart';

class DetailsController extends GetxController {
  ApiConsumer api =getIt<ApiConsumer>();

  Future<void> claim(int reportId  ) async {
    try {
      await api.post(EndPoint.claims,
      data: {
         "reportId": reportId
      });
      Get.to(() =>  DonePage(text: "claim received for review".tr,));
      
    } on ServerException catch (e) {
      Get.snackbar(
        e.erorrModel.title,
        e.erorrModel.erorrmessage,
        animationDuration: Duration(seconds: 3),
      );
    }
  }
}