import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../helper/locator.dart';

config() {
  initLocator();
  _configLoading();
}

void _configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.doubleBounce
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..userInteractions = true
    ..dismissOnTap = false;
}
