
import 'package:openaiapp/helper/locator.dart';
import 'package:openaiapp/network/api_base_helper.dart';


class MyNetworkClient {
  final _service = locator<ApiBaseHelper>();

  // Future<RegisterResponse> register(RegisterRequest request) async {
  //   var map = jsonEncode(request.toJson());
  //   final response = await _service.post(kRegister, map);
  //   return RegisterResponse.fromJson(response);
  // }

}
