import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lostandfound/core/api/api_consumer.dart';
import 'package:lostandfound/core/api/dio_consumer.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {

  getIt.registerSingleton<ApiConsumer>(DioConsumer(dio: Dio()) );
}
