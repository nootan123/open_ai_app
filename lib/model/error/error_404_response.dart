// To parse this JSON data, do
//
//     final error404Response = error404ResponseFromJson(jsonString);

import 'dart:convert';

Error404Response error404ResponseFromJson(String str) =>
    Error404Response.fromJson(json.decode(str));

String error404ResponseToJson(Error404Response data) =>
    json.encode(data.toJson());

class Error404Response {
  Error404Response({
    this.timestamp,
    this.status,
    this.error,
    this.message,
    this.path,
  });

  String? timestamp;
  int? status;
  String? error;
  String? message;
  String? path;

  factory Error404Response.fromJson(Map<String, dynamic> json) =>
      Error404Response(
        timestamp: json["timestamp"] == null ? null : json["timestamp"],
        status: json["status"] == null ? null : json["status"],
        error: json["error"] == null ? null : json["error"],
        message: json["message"] == null ? null : json["message"],
        path: json["path"] == null ? null : json["path"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp == null ? null : timestamp,
        "status": status == null ? null : status,
        "error": error == null ? null : error,
        "message": message == null ? null : message,
        "path": path == null ? null : path,
      };
}
