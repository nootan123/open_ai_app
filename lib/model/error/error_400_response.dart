// To parse this JSON data, do
//
//     final error400Response = error400ResponseFromJson(jsonString);

import 'dart:convert';

Error400Response error400ResponseFromJson(String str) =>
    Error400Response.fromJson(json.decode(str));

String error400ResponseToJson(Error400Response data) =>
    json.encode(data.toJson());

class Error400Response {
  Error400Response({
    this.status,
    this.message,
  });

  int? status;
  String? message;

  factory Error400Response.fromJson(Map<String, dynamic> json) =>
      Error400Response(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
