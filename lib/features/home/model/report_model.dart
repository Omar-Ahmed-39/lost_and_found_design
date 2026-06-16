class ItemsResponse {
  final int pageNumber;
  final int pageSize;
  final int totalPages;
  final int totalRecords;
  final bool succeeded;
  final String message;
  final List<ItemData> data;
  final List<String>? errors;

  ItemsResponse({
    required this.pageNumber,
    required this.pageSize,
    required this.totalPages,
    required this.totalRecords,
    required this.succeeded,
    required this.message,
    required this.data,
    this.errors,
  });

  factory ItemsResponse.fromJson(Map<String, dynamic> json) {
    return ItemsResponse(
      pageNumber: json['pageNumber'] ?? 0,
      pageSize: json['pageSize'] ?? 0,
      totalPages: json['totalPages'] ?? 0,
      totalRecords: json['totalRecords'] ?? 0,
      succeeded: json['succeeded'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? List<ItemData>.from(
              json['data'].map((item) => ItemData.fromJson(item)),
            )
          : [],
      errors: json['errors'] != null
          ? List<String>.from(json['errors'])
          : null,
    );
  }
}

class ItemData {
  final int id;
  final String itemName;
  final String imagePath;
  final DateTime? dateReported;

  final String reportType;
  final String status;
  final String locationName;
  final String reporterName;

  ItemData({
    required this.id,
    required this.itemName,
    required this.imagePath,
    required this.dateReported,
    required this.reportType,
    required this.status,
    required this.locationName,
    required this.reporterName,
  });

  factory ItemData.fromJson(Map<String, dynamic> json) {
    return ItemData(
      id: json['id'] ?? 0,
      itemName: json['itemName'] ?? '',
      imagePath: json['imagePath'] ?? '',

      dateReported: json['dateReported'] != null
          ? DateTime.parse(json['dateReported'])
          : null,

      reportType: json['reportType'] ?? '',
      status: json['status'] ?? '',
      locationName: json['locationName'] ?? '',
      reporterName: json['reporterName'] ?? '',
    );
  }
}