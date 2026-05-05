import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/api/api_consumer.dart';
import 'package:lostandfound/core/api/dio_consumer.dart';
import 'package:lostandfound/core/api/end_points.dart';
import 'package:lostandfound/core/error/exception.dart';
import 'package:lostandfound/features/home/model/report_model.dart';
import 'package:lostandfound/model/home_model.dart';

enum HomeState {
  initial,
  loading,
  success,
  empty,
  error,
}

class HomeController extends GetxController {
  ApiConsumer api = DioConsumer(dio: Dio());

  HomeState state = HomeState.initial;

  List<ItemData> items = [];


  @override
  void onInit() {
    super.onInit();
    getItems();
  }

  Future<void> getItems() async {
    state = HomeState.loading;
    update();

    try {
      final response = await api.get(EndPoint.reports);

      final itemsResponse = ItemsResponse.fromJson(response);

      if (itemsResponse.succeeded) {
        items = itemsResponse.data;

        if (items.isEmpty) {
          state = HomeState.empty;
        } else {
          state = HomeState.success;
        }
      } else {
        

        state = HomeState.error;
      }

      update();
    } on ServerException catch (e) {
      state = HomeState.error;
      update();

      Get.snackbar(
        e.erorrModel.title,
        e.erorrModel.erorrmessage,
        animationDuration: const Duration(seconds: 3),
      );
    }
  }
}