// To parse this JSON data, do
//
//     final error401Response = error401ResponseFromJson(jsonString);

import 'dart:convert';

Error401Response error401ResponseFromJson(String str) =>
    Error401Response.fromJson(json.decode(str));

String error401ResponseToJson(Error401Response data) =>
    json.encode(data.toJson());

class Error401Response {
  Error401Response({
    this.status,
    this.data,
    this.message,
  });

  int? status;
  Data? data;
  String? message;

  factory Error401Response.fromJson(Map<String, dynamic> json) =>
      Error401Response(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? null : data?.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    this.success,
  });

  bool? success;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
      };
}
