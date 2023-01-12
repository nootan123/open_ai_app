import 'package:flutter/material.dart';
import 'package:openaiapp/constants/app_image.dart';
import 'package:openaiapp/constants/string.dart';
import 'package:lottie/lottie.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({this.errorMessage = kErrorMessage, Key? key})
      : super(key: key);
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LottieBuilder.asset(kErrorImage),
        Expanded(child: Text("$kOups $errorMessage"))
      ],
    );
  }
}
