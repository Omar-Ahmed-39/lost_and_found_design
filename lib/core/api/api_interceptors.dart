
import 'package:dio/dio.dart';
import 'package:lostandfound/core/api/api_consumer.dart';
import 'package:lostandfound/core/api/end_points.dart';
import 'package:lostandfound/core/database/cache/cache_helper.dart';
import 'package:lostandfound/core/services/get_it_services.dart';

class ApiInterceptor extends Interceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    options.headers["accept-lan"]="ar";
    options.headers["Authorization"]="Bearer ${CacheHelper.getData(key: ApiKey.token)??"null"}";
    options.headers['Accept'] = 'application/json';
    


    // TODO: implement onRequest
    super.onRequest(options, handler);
  }
@override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    // التحقق مما إذا كان الخطأ بسبب انتهاء صلاحية التوكن (401)
    if (err.response?.statusCode == 401) {
      try {
        final oldToken = CacheHelper.getData(key: ApiKey.token);
        final refreshToken = CacheHelper.getData(key: ApiKey.refreshToken);

        // حل المشكلة 3: نستخدم نسخة Dio منفصلة وخام لطلب الـ Refresh لتجنب الحلقة اللانهائية
        final refreshDio = Dio(); 
        
        final refreshResponse = await refreshDio.post(
          EndPoint.refreshToken,
          data: {
            "token": oldToken,
            "refreshToken": refreshToken,
          },
        );

        // استخراج التوكنز الجديدة (تأكد من مطابقة الـ Keys حسب رد السيرفر لديك)
        final newToken = refreshResponse.data["data"]["token"];
        final newRefreshToken = refreshResponse.data["data"]["refreshToken"];

        // حفظ التوكنز الجديدة في الكاش
        await CacheHelper.saveData(key: ApiKey.token, value: newToken);
        await CacheHelper.saveData(key: ApiKey.refreshToken, value: newRefreshToken);

        // حل المشكلة 1: تحديث هيدر الطلب الأصلي الذي فشل بالتوكن الجديد
        final originalOptions = err.requestOptions;
        originalOptions.headers["Authorization"] = "Bearer $newToken";

        // إعادة إرسال الطلب الأصلي مجدداً بالبيانات الجديدة
        final retryResponse = await refreshDio.fetch(originalOptions);
        
        // تمرير الاستجابة الناجحة الجديدة للتطبيق وكأن الخطأ لم يحدث
        return handler.resolve(retryResponse);

      } catch (e) {
        // إذا فشل تحديث التوكن (مثلاً الـ Refresh Token انتهى نهائياً)، نمرر الخطأ ليتم التعامل معه (كتوجيه المستخدم لصفحة تسجيل الدخول)
        return handler.next(err);
      }
    }

    // تمرير الأخطاء الأخرى (مثل 404 أو 500) بشكل طبيعي دون تدخل
    super.onError(err, handler);
  }
  
}