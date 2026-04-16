import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lostandfound/core/api/api_consumer.dart';
import 'package:lostandfound/core/api/dio_consumer.dart';
import 'package:lostandfound/core/api/end_points.dart';
import 'package:lostandfound/core/database/cache/cache_helper.dart';
import 'package:lostandfound/core/error/exception.dart';
import 'package:lostandfound/model/signin_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit( this.api) : super(AuthInitial(),);
  final ApiConsumer api;
  
  Future signDio( String email,String password)async{
  emit(SinginLoading());
 try {
 
 var responce=await api.post(EndPoint.signIn,
  data: {
       ApiKey.email: email.trim(),
         ApiKey.password: password.trim(),
  
  });
 SignInModel user=SignInModel.fromJson(responce);
  CacheHelper().saveData(key: "token", value: user.dataSignin.token);
  emit(SinginSuccess(user: user));
   
  

} on ServerException catch (e) {
 emit(SinginErorr(message: e.erorrModel.erorrmessage));
 emit(AuthInitial());

 }

}
Future signUpDio(
  String name,
  String email,
  String password,
  String phone,
) async {
  emit(SingupLoading());

  try {
    var responce = await api.post(
      EndPoint.signUp,
      data: {
        ApiKey.name: name.trim(),
        ApiKey.email: email.trim(),
        ApiKey.password: password.trim(),
        ApiKey.phone: phone.trim(),
      },
    );

    // إذا عندك مودل خاص بالتسجيل استخدمه هنا
    // مثال:
    // SignUpModel user = SignUpModel.fromJson(responce);

    emit(SingupSuccess());
  } on ServerException catch (e) {
    emit(SingupErorr(message: e.erorrModel.erorrmessage));
    emit(AuthInitial());
  }
}


}