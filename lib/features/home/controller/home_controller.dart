import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/api/api_consumer.dart';
import 'package:lostandfound/core/api/dio_consumer.dart';
import 'package:lostandfound/core/error/exception.dart';
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

  List<Post> posts = [];

  String url = 'https://picsum.photos/400/400';

  String errorMessage = '';

  @override
  void onInit() {
    super.onInit();
    getPosts();
  }

  Future<void> getPosts() async {
    state = HomeState.loading;
    errorMessage = '';
    update();

    try {
      final response = await api.get("posts");

      final List<dynamic> data = response["data"] ?? [];

      posts = data.map((item) => Post.fromJson(item)).toList();

      if (posts.isEmpty) {
        state = HomeState.empty;
      } else {
        state = HomeState.success;
      }

      update();
    } on ServerException catch (e) {
      errorMessage = e.erorrModel.erorrmessage;
      state = HomeState.error;
      update();

      Get.snackbar(
        "خطأ",
        errorMessage,
        animationDuration: const Duration(seconds: 3),
      );
    } 
  }
}