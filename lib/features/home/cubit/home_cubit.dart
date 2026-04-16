import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lostandfound/core/api/api_consumer.dart';
import 'package:lostandfound/core/error/exception.dart';
import 'package:lostandfound/model/home_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.api) : super(HomeInitial());

  final ApiConsumer api;

  Future<void> getPosts() async {
    emit(HomeLoading());

    try {
      final response = await api.get("posts");
      final List<dynamic> data = response["data"];
      final posts = data.map((item) => Post.fromJson(item)).toList();

      emit(HomeSuccess(posts: posts));
    }on ServerException catch (e) {
      emit(HomeError(message: e.erorrModel.erorrmessage));
    }
  }
}