import 'dart:async';

import 'package:openaiapp/blocs/base_bloc.dart';
import 'package:openaiapp/constants/string.dart';
import 'package:openaiapp/model/request/openai_request_model.dart';
import 'package:openaiapp/model/response/openai_response_model.dart';
import 'package:openaiapp/network/api_response.dart';
import 'package:rxdart/rxdart.dart';


class RequestBloc extends BaseBloc {
  late StreamController<ApiResponse<OpenaiResponseModel>> _controller;
  StreamSink<ApiResponse<OpenaiResponseModel>> get dataSink =>
      _controller.sink;
  Stream<ApiResponse<OpenaiResponseModel>> get dataStream =>
      _controller.stream;
  RequestBloc() {
    _controller = BehaviorSubject<ApiResponse<OpenaiResponseModel>>();
  }
  void fetchData(OpenaiRequestModel request) async {
    dataSink.add(ApiResponse.loading(kEmpty));

    try {
      OpenaiResponseModel response =
          await myNetworkClient.requestQuery(request);
      dataSink.add(ApiResponse.completed(response));
    } catch (e) {
      dataSink.add(ApiResponse.error(e.toString()));
    }
  }

  @override
  dispose() {
    _controller.close();
  }
}
