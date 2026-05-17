class EndPoint {
  static String baseUrl = "http://127.0.0.1:5000/api/v1/";
  static String signIn = "auth/login";
  static String claims= "claims";
  static String signUp = "auth/register";
  static String logout = "auth/logout";
  static String refreshToken = "auth/refresh";
  static String categories = "admin/categories";
  static String changePassword = "auth/change-password";
  static String support = "feedbacks";

  static String reports = "reports";

  
  static String getReportsEndPoint({
  String? search,
  int? reportType,
  int? categoryId,
  required int pageNumber,
  required int pageSize,
}) {
  return Uri(
    path: "reports",
    queryParameters: {
      if (search?.isNotEmpty == true) 'search': search,
      if (reportType != null) 'reportType': reportType.toString(),
      if (categoryId != null) 'categoryId': categoryId.toString(),

      'pageNumber': pageNumber.toString(),
      'pageSize': pageSize.toString(),
    },
  ).toString();
}
}

class ApiKey {
  static String status = "status";
  static String errorMessage = "message";
  static String email = "email";
  static String password = "password";
  static String token = "token";
    static const String refreshToken = "refreshToken";

  static String data = "data";

  static String message = "message";
  static String id = "id";
  static String name = "name";
  static String phone = "phone";
  static String confirmPassword = "confirmPassword";
  static String location = "location";
  static String profilePic = "profilePic";

  static String user = "user";
  static String role = "role";
  static String email_verified_at = "email_verified_at";
  static String otp_code = "otp_code";
  static String otp_expires_at = "otp_expires_at";
  static String otp_attempts = "otp_attempts";
  static String created_at = "created_at";
  static String updated_at = "updated_at";
  static String content = "content";
  static String image = "image";


  

  

  


}