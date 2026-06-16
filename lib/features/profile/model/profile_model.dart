class ProfileResponse {
  final bool succeeded;
  final String message;
  final UserData? data;
  final List<String>? errors;

  ProfileResponse({
    required this.succeeded,
    required this.message,
    required this.data,
    this.errors,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      succeeded: json['succeeded'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? UserData.fromJson(json['data'])
          : null,
      errors: json['errors'] != null
          ? List<String>.from(json['errors'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'succeeded': succeeded,
      'message': message,
      'data': data?.toJson(),
      'errors': errors,
    };
  }
}

class UserData {
  final String name;
  final String email;
  final String avatarUrl;

  UserData({
    required this.name,
    required this.email,
    required this.avatarUrl,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      avatarUrl: json['avatarUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'avatarUrl': avatarUrl,
    };
  }
}
