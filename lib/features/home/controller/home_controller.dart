import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:lostandfound/core/api/api_consumer.dart';
import 'package:lostandfound/core/api/dio_consumer.dart';
import 'package:lostandfound/core/api/end_points.dart';
import 'package:lostandfound/core/error/exception.dart';
import 'package:lostandfound/core/services/get_it_services.dart';
import 'package:lostandfound/features/home/model/report_model.dart';


enum HomeState { initial, loading, success, empty, error }

class HomeController extends GetxController {
  ApiConsumer api =getIt<ApiConsumer>();
  HomeState state = HomeState.initial;
  List<ItemData> items = [];

  int currentPage = 1;
  final int pageSize = 15;
  bool isPaginating = false;
  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    getItems();
  }

  void _scrollListener() {
    if (scrollController.position.pixels >= scrollController.position.maxScrollExtent * 0.9) {
      if (!isPaginating && state == HomeState.success) {
        getMoreItems();
      }
    }
  }

  Future<void> getItems() async {
    currentPage = 1;
    state = HomeState.loading;
    update();

    try {
      final response = await api.get(EndPoint.getReportsEndPoint(
        pageNumber: currentPage,
        pageSize: pageSize,
      ));
      final itemsResponse = ItemsResponse.fromJson(response);
      if (itemsResponse.succeeded) {
        items = itemsResponse.data;
        state = items.isEmpty ? HomeState.empty : HomeState.success;
      }
    }  on ServerException catch (e) {
      
      state = HomeState.error;
        Get.snackbar(e.erorrModel.title, e.erorrModel.erorrmessage,  animationDuration: Duration(seconds: 3)
);
    }
    update();
  }

  Future<void> getMoreItems() async {
    isPaginating = true;
    update();
    try {
      currentPage++;
      final response = await api.get(EndPoint.getReportsEndPoint(
        pageNumber: currentPage,
        pageSize: pageSize,
      ));
      final itemsResponse = ItemsResponse.fromJson(response);
      if (itemsResponse.succeeded && itemsResponse.data.isNotEmpty) {
        items.addAll(itemsResponse.data);
      }
    }on ServerException catch (e) {
  Get.snackbar(e.erorrModel.title, e.erorrModel.erorrmessage,  animationDuration: Duration(seconds: 3)
);    } finally {
      isPaginating = false;
      update();
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}