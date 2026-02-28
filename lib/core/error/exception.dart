import 'package:dio/dio.dart';
import 'package:lostandfound/core/error/erorr_model.dart';

class ServerException implements Exception{
  final ErorrModel erorrModel;

  ServerException({required this.erorrModel});
}

void handelDioExcepton(DioException e) {
    switch(e.type){
      
      case DioExceptionType.connectionTimeout:
        throw ServerException(erorrModel: ErorrModel.fromJson(e.response!.data));
    
      case DioExceptionType.sendTimeout:
              throw ServerException(erorrModel: ErorrModel.fromJson(e.response!.data));
    
      case DioExceptionType.receiveTimeout:
              throw ServerException(erorrModel: ErorrModel.fromJson(e.response!.data));
    
      case DioExceptionType.badCertificate:    
        throw ServerException(erorrModel: ErorrModel.fromJson(e.response!.data));
    
     
      case DioExceptionType.cancel:
              throw ServerException(erorrModel: ErorrModel.fromJson(e.response!.data));
    
      case DioExceptionType.connectionError:
              throw ServerException(erorrModel: ErorrModel.fromJson(e.response!.data));
    
      case DioExceptionType.unknown:
              throw ServerException(erorrModel: ErorrModel.fromJson(e.response!.data));
    
    
        
    
         case DioExceptionType.badResponse:
            switch (e.response?.statusCode) {
          case 400: // Bad request
            throw ServerException(
                erorrModel: ErorrModel.fromJson(e.response!.data));
          case 401: //unauthorized
            throw ServerException(
                erorrModel: ErorrModel.fromJson(e.response!.data));
          case 403: //forbidden
            throw ServerException(
                erorrModel: ErorrModel.fromJson(e.response!.data));
          case 404: //not found
            throw ServerException(
                erorrModel: ErorrModel.fromJson(e.response!.data));
          case 409: //cofficient
            throw ServerException(
                erorrModel: ErorrModel.fromJson(e.response!.data));
          case 422: //  Unprocessable Entity
            throw ServerException(
                erorrModel: ErorrModel.fromJson(e.response!.data));
          case 504: // Server exception
            throw ServerException(
                erorrModel: ErorrModel.fromJson(e.response!.data));
        }
    }
  }