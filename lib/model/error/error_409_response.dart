// To parse this JSON data, do
//
//     final error409Response = error409ResponseFromJson(jsonString);

import 'dart:convert';

Error409Response error409ResponseFromJson(String str) =>
    Error409Response.fromJson(json.decode(str));

String error409ResponseToJson(Error409Response data) =>
    json.encode(data.toJson());

class Error409Response {
  Error409Response({
    this.status,
    this.data,
    this.message,
  });

  int? status;
  Data? data;
  String? message;

  factory Error409Response.fromJson(Map<String, dynamic> json) =>
      Error409Response(
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
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data();

  Map<String, dynamic> toJson() => {};
}
