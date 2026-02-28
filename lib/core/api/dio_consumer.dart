
import 'package:dio/dio.dart';
import 'package:lostandfound/core/api/api_consumer.dart';
import 'package:lostandfound/core/api/api_interceptors.dart';
import 'package:lostandfound/core/api/end_points.dart';
import 'package:lostandfound/core/error/exception.dart';

class DioConsumer extends ApiConsumer{
 final Dio dio;

  DioConsumer({required this.dio}){
    dio.options.baseUrl=EndPoint.baseUrl;
    
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));

  }
  @override
  Future<dynamic> delete(String path, {dynamic data, Map<String, dynamic>? queryParametr,bool isFromData = false,})async {
     try {
  final response = await dio.delete(
   path,
   data:isFromData ? FormData.fromMap(data) : data,
   queryParameters: queryParametr
      );
      return response.data;
} on DioException catch (e) {
  handelDioExcepton(e);
  
} 
  }

  

  @override
  Future<dynamic> get(String path, {Object? data, Map<String, dynamic>? queryParametr}) async{
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParametr,
      );
      return response.data;
    } on DioException catch (e) {
      handelDioExcepton(e);
    }
  }

  @override
  Future<dynamic> patch(String path, {dynamic data, Map<String, dynamic>? queryParametr,bool isFromData = false,}) async{
     try {
      final response = await dio.patch(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParametr,
      );
      return response.data;
    } on DioException catch (e) {
      handelDioExcepton(e);
    }
  }

  @override
  Future<dynamic> post(String path, {dynamic data, Map<String, dynamic>? queryParametr,bool isFromData = false,}) async{
   try {
      final response = await dio.post(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParametr,
      );
      return response.data;
    } on DioException catch (e) {
      handelDioExcepton(e);
    }
  }
  
 
}
// class HttpConsumer extends ApiConsumer{
//   @override
//   Future<dynamic> delete(String path, {Object? data, Map<String, dynamic>? queryParametr}) {
//     // TODO: implement delete
//     throw UnimplementedError();
//   }

//   @override
//   Future<dynamic> get(String path, {Object? data, Map<String, dynamic>? queryParametr}) {
//     // TODO: implement get
//     throw UnimplementedError();
//   }

//   @override
//   Future<dynamic> patch(String path, {Object? data, Map<String, dynamic>? queryParametr}) {
//     // TODO: implement patch
//     throw UnimplementedError();
//   }

//   @override
//   Future<dynamic> post(String path, {Object? data, Map<String, dynamic>? queryParametr}) {
//     // TODO: implement post
//     throw UnimplementedError();
//   }

// }

