class MatchResponse {
  final bool succeeded;
  final String message;
  final MatchData? data;
  final List<String>? errors;

  MatchResponse({
    required this.succeeded,
    required this.message,
    this.data,
    this.errors,
  });

  factory MatchResponse.fromJson(
      Map<String, dynamic> json) {
    return MatchResponse(
      succeeded: json["succeeded"] ?? false,
      message: json["message"] ?? "",
      data: json["data"] != null
          ? MatchData.fromJson(json["data"])
          : null,
      errors: json["errors"] != null
          ? List<String>.from(json["errors"])
          : null,
    );
  }
}

class MatchData {
  final int id;
  final double matchScore;
  final int status;
  final int lostId;
  final int foundId;

  MatchData({
    required this.id,
    required this.matchScore,
    required this.status,
    required this.lostId,
    required this.foundId,
  });

  factory MatchData.fromJson(
      Map<String, dynamic> json) {
    return MatchData(
      id: json["id"] ?? 0,
      matchScore:
          (json["matchScore"] ?? 0).toDouble(),
      status: json["status"] ?? 0,
      lostId: json["lostId"] ?? 0,
      foundId: json["foundId"] ?? 0,
    );
  }
}