import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({this.loadingSize = 100, Key? key}) : super(key: key);
  final double loadingSize;

  @override
  Widget build(BuildContext context) {
    //PouringHourGlassRefined
    return const SizedBox(
      height: 200,
      width: 200,
      child: CupertinoActivityIndicator(
        color: Colors.green,
        radius: 25,
      ),
    );
  }
}
