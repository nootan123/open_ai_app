import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:openaiapp/network/api_base_helper.dart';
import 'package:openaiapp/network/my_network_client.dart';
import 'package:http/http.dart' as http;

GetIt locator = GetIt.I;
initLocator() {
  locator.registerFactory<ApiBaseHelper>(() => ApiBaseHelper());
  locator.registerFactory<MyNetworkClient>(() => MyNetworkClient());

  

  locator.registerFactory<ChuckerHttpClient>(
      () => ChuckerHttpClient(http.Client()));
}
