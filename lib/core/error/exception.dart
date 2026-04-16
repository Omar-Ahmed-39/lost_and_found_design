import 'package:dio/dio.dart';
import 'package:lostandfound/core/error/erorr_model.dart';

class ServerException implements Exception {
  final ErorrModel erorrModel;

  ServerException({required this.erorrModel});
}

void handelDioExcepton(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(
        erorrModel: ErorrModel.fromJson({
          "status": 0,
          "message": "انتهت مهلة الاتصال بالخادم",
        }),
      );

    case DioExceptionType.sendTimeout:
      throw ServerException(
        erorrModel: ErorrModel.fromJson({
          "status": 0,
          "message": "انتهت مهلة إرسال الطلب",
        }),
      );

    case DioExceptionType.receiveTimeout:
      throw ServerException(
        erorrModel: ErorrModel.fromJson({
          "status": 0,
          "message": "انتهت مهلة استلام البيانات من الخادم",
        }),
      );

    case DioExceptionType.badCertificate:
      throw ServerException(
        erorrModel: ErorrModel.fromJson({
          "status": 0,
          "message": "شهادة الأمان غير صالحة",
        }),
      );

    case DioExceptionType.cancel:
      throw ServerException(
        erorrModel: ErorrModel.fromJson({
          "status": 0,
          "message": "تم إلغاء الطلب",
        }),
      );

    case DioExceptionType.connectionError:
      throw ServerException(
        erorrModel: ErorrModel.fromJson({
          "status": 0,
          "message": "لايوجد اتصال بالانترنت",
        }),
      );

    case DioExceptionType.unknown:
      throw ServerException(
        erorrModel: ErorrModel.fromJson({
          "status": 0,
          "message": "حدث خطأ غير متوقع، حاول مرة أخرى",
        }),
      );

    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad request
          throw ServerException(
            erorrModel: ErorrModel.fromJson(e.response!.data),
          );
        case 401: //unauthorized
          throw ServerException(
            erorrModel: ErorrModel.fromJson(e.response!.data),
          );
        case 403: //forbidden
          throw ServerException(
            erorrModel: ErorrModel.fromJson(e.response!.data),
          );
        case 404: //not found
          throw ServerException(
            erorrModel: ErorrModel.fromJson(e.response!.data),
          );
        case 409: //cofficient
          throw ServerException(
            erorrModel: ErorrModel.fromJson(e.response!.data),
          );
        case 422: //  Unprocessable Entity
          throw ServerException(
            erorrModel: ErorrModel.fromJson(e.response!.data),
          );
        case 504: // Server exception
          throw ServerException(
            erorrModel: ErorrModel.fromJson(e.response!.data),
          );
      }
  }
}
