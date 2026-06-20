import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/api/api_consumer.dart';
import 'package:lostandfound/core/api/dio_consumer.dart';
import 'package:lostandfound/core/api/end_points.dart';
import 'package:lostandfound/core/error/exception.dart';
import 'package:lostandfound/core/services/get_it_services.dart';
import 'package:lostandfound/features/home/model/details_model.dart';
import 'package:lostandfound/features/home/view/done.dart';

class DetailsController extends GetxController {
  ApiConsumer api =getIt<ApiConsumer>();
  String description="";
  List<ReportImage> images = [];
  int currentImageIndex = 0;
  void changeImage(int index) {
  currentImageIndex = index;
  update();
}

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
  Future<void> getReportById(int reportId  ) async {
    try {
      final response= await api.get(EndPoint.getReportById(reportId),
      data: {
         "id": reportId
      });

      ReportDetailsResponse reportDetailsResponse=ReportDetailsResponse.fromJson(response);
      description=reportDetailsResponse.data!.description;
      images = reportDetailsResponse.data?.images ?? [];
      
      update();
    } on ServerException catch (e) {
      Get.snackbar(
        e.erorrModel.title,
        e.erorrModel.erorrmessage,
        animationDuration: Duration(seconds: 3),
      );
    }
  }
}