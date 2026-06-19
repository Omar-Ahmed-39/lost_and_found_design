class ReportDetailsResponse {
  final bool succeeded;
  final String message;
  final ReportDetailsData? data;
  final List<String>? errors;

  ReportDetailsResponse({
    required this.succeeded,
    required this.message,
    this.data,
    this.errors,
  });

  factory ReportDetailsResponse.fromJson(
      Map<String, dynamic> json) {
    return ReportDetailsResponse(
      succeeded: json['succeeded'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? ReportDetailsData.fromJson(json['data'])
          : null,
      errors: json['errors'] != null
          ? List<String>.from(json['errors'])
          : null,
    );
  }
}

class ReportDetailsData {
  final int id;
  final String itemName;
  final List<ReportImage> images;
  final String reportType;
  final String locationName;
  final DateTime? dateReported;
  final String description;

  ReportDetailsData({
    required this.id,
    required this.itemName,
    required this.images,
    required this.reportType,
    required this.locationName,
    required this.dateReported,
    required this.description,
  });

  factory ReportDetailsData.fromJson(
      Map<String, dynamic> json) {
    return ReportDetailsData(
      id: json['id'] ?? 0,
      itemName: json['itemName'] ?? '',
      images: json['images'] != null
          ? List<ReportImage>.from(
              json['images']
                  .map((x) => ReportImage.fromJson(x)),
            )
          : [],
      reportType: json['reportType'] ?? '',
      locationName: json['locationName'] ?? '',
      dateReported: json['dateReported'] != null
          ? DateTime.parse(json['dateReported'])
          : null,
      description: json['description'] ?? '',
    );
  }
}

class ReportImage {
  final int id;
  final String path;

  ReportImage({
    required this.id,
    required this.path,
  });

  factory ReportImage.fromJson(
      Map<String, dynamic> json) {
    return ReportImage(
      id: json['id'] ?? 0,
      path: json['path'] ?? '',
    );
  }
}
