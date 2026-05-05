import 'package:lostandfound/core/api/end_points.dart';

class SignInModel {
  final DataSignin dataSignin;

  SignInModel({ required this.dataSignin});

  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(
      dataSignin:DataSignin.fromJson(jsonData[ApiKey.data])
    );
  }
}

class DataSignin{
  final String token;
  final String refreshToken;

  DataSignin({required this.token, required this.refreshToken});

  factory DataSignin.fromJson(Map<String, dynamic> jsonData) {
    return DataSignin(
      token: jsonData[ApiKey.token],
      refreshToken: jsonData[ApiKey.refreshToken],
    );
  }



}


