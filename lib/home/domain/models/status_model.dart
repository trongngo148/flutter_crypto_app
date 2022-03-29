class StatusModel {
  final String timestamp;
  final int errorCode;
  final String errorMessage;
  final int elapsed;
  final int creditCount;
  final String notice;
  final int totalCount;

  StatusModel(
    this.timestamp,
    this.errorCode,
    this.errorMessage,
    this.elapsed,
    this.creditCount,
    this.notice,
    this.totalCount,
  );

  factory StatusModel.fromJson(Map<String, dynamic> json) {
    return StatusModel(
      json["timestamp"],
      json["error_code"],
      json["error_message"] ?? "",
      json["elapsed"] ?? 0,
      json["credit_count"],
      json["notice"] ?? "",
      json["total_count"],
    );
  }
}
