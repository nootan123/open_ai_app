import 'dart:convert';

import 'package:openaiapp/constants/api_end_point.dart';
import 'package:openaiapp/helper/locator.dart';
import 'package:openaiapp/model/request/openai_request_model.dart';
import 'package:openaiapp/model/response/openai_response_model.dart';
import 'package:openaiapp/network/api_base_helper.dart';

class MyNetworkClient {
  final _service = locator<ApiBaseHelper>();

  Future<OpenaiResponseModel> requestQuery(OpenaiRequestModel request) async {
    var map = jsonEncode(request.toJson());
    final response = await _service.post(kOpenaiRequestUrl, map);
    return OpenaiResponseModel.fromJson(response);
  }
}
