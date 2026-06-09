class LocationsResponse {
  final bool succeeded;
  final String message;
  final List<LocationModel> data;
  final dynamic errors;

  LocationsResponse({
    required this.succeeded,
    required this.message,
    required this.data,
    this.errors,
  });

  factory LocationsResponse.fromJson(Map<String, dynamic> json) {
    return LocationsResponse(
      succeeded: json['succeeded'] ?? false,
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => LocationModel.fromJson(e))
              .toList() ??
          [],
      errors: json['errors'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'succeeded': succeeded,
      'message': message,
      'data': data.map((e) => e.toJson()).toList(),
      'errors': errors,
    };
  }
}

class LocationModel {
  final int id;
  final String name;
  final int locationType;
  final int departmentId;
  final String departmentName;

  LocationModel({
    required this.id,
    required this.name,
    required this.locationType,
    required this.departmentId,
    required this.departmentName,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      locationType: json['locationType'] ?? 0,
      departmentId: json['departmentId'] ?? 0,
      departmentName: json['departmentName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'locationType': locationType,
      'departmentId': departmentId,
      'departmentName': departmentName,
    };
  }
}