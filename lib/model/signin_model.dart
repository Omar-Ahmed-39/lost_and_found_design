import 'package:lostandfound/core/api/end_points.dart';

class SignInModel {
  final String message;
  final DataSignin dataSignin;

  SignInModel({required this.message, required this.dataSignin});

  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(
      message: jsonData[ApiKey.message],
      dataSignin:DataSignin.fromJson(jsonData[ApiKey.data])
    );
  }
}
class DataSignin{
  final String token;
  final UserSignin user;

  DataSignin({required this.token, required this.user});

  factory DataSignin.fromJson(Map<String, dynamic> jsonData) {
    return DataSignin(
      token: jsonData[ApiKey.token],
      user: UserSignin.fromJson(jsonData[ApiKey.user]),
    );
  }



}

class UserSignin {
  final int id;
  final String name;
  final String email;
  final String role;
  final String? emailVerifiedAt;
  final String? otpCode;
  final String? otpExpiresAt;
  final int otpAttempts;
  final String createdAt;
  final String updatedAt;

  UserSignin({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.emailVerifiedAt,
    this.otpCode,
    this.otpExpiresAt,
    required this.otpAttempts,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserSignin.fromJson(Map<String, dynamic> jsonData) {
    return UserSignin(
      id: jsonData['id'],
      name: jsonData['name'],
      email: jsonData['email'],
      role: jsonData['role'],
      emailVerifiedAt: jsonData['email_verified_at'],
      otpCode: jsonData['otp_code'],
      otpExpiresAt: jsonData['otp_expires_at'],
      otpAttempts: jsonData['otp_attempts'],
      createdAt: jsonData['created_at'],
      updatedAt: jsonData['updated_at'],
    );
  }
}

