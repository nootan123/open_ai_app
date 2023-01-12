import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:openaiapp/constants/api_end_point.dart';
import 'package:openaiapp/helper/locator.dart';
import 'package:openaiapp/key/key.dart';
import 'package:openaiapp/model/error/error_400_response.dart';
import 'package:openaiapp/model/error/error_401_response.dart';
import 'package:openaiapp/model/error/error_404_response.dart';
import 'package:openaiapp/model/error/error_409_response.dart';

import 'app_exception.dart';

class ApiBaseHelper {
  final _chuckerHttpClient = locator<ChuckerHttpClient>();

  Future<dynamic> get(String url, {String? auth}) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(kBaseUrl + url),
          headers: auth != null
              ? <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                  'Authorization': auth
                }
              : <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                });
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', 1002);
    }
    return responseJson;
  }

  Future<dynamic> post(String url, String map) async {
    debugPrint("Request body: $map");
    dynamic responseJson;
    try {
      final response = await _chuckerHttpClient
          .post(Uri.parse(kBaseUrl + url), body: map, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': "Bearer $secretKey",
      });
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', 1002);
    }
    return responseJson;
  }

  Future<dynamic> put(String url, String map, {String? auth}) async {
    debugPrint("Request body: $map");
    dynamic responseJson;
    try {
      final response = await _chuckerHttpClient.put(Uri.parse(kBaseUrl + url),
          body: map,
          headers: auth != null
              ? <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                  'Authorization': auth
                }
              : <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                });
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', 1002);
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    debugPrint("Response body: ${response.body}");
    debugPrint("Request Url: ${response.request?.url}");
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        Error400Response errorResponse =
            Error400Response.fromJson(json.decode(response.body));
        throw BadRequestException(
            errorResponse.message.toString(), response.statusCode);

      case 401:
        Error401Response errorResponse =
            Error401Response.fromJson(json.decode(response.body));
        throw UnauthorisedException(
            errorResponse.message.toString(), response.statusCode);

      case 403:
        throw UnauthorisedException(
            response.body.toString(), response.statusCode);

      case 404:
        Error404Response errorResponse =
            Error404Response.fromJson(json.decode(response.body));
        throw NotFoundException(
            errorResponse.message.toString(), response.statusCode);

      case 409:
        Error409Response errorResponse =
            Error409Response.fromJson(json.decode(response.body));
        throw ConflictException(
            errorResponse.message.toString(), response.statusCode);
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}',
            response.statusCode);
    }
  }
}
