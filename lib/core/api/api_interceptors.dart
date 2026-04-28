
import 'package:dio/dio.dart';
import 'package:lostandfound/core/api/end_points.dart';
import 'package:lostandfound/core/database/cache/cache_helper.dart';

class ApiInterceptor extends Interceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    options.headers["accept-lan"]="ar";
    options.headers["Authorization"]="Bearer ${CacheHelper.getData(key: ApiKey.token)??"null"}";
    options.headers['Accept'] = 'application/json';
    


    // TODO: implement onRequest
    super.onRequest(options, handler);
  }
  
}