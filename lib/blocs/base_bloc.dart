import 'package:openaiapp/network/my_network_client.dart';

import '../helper/locator.dart';

abstract class BaseBloc {
  final myNetworkClient = locator<MyNetworkClient>();

  dispose();
}
