import 'package:flutter/material.dart';
import 'package:openaiapp/route/route_name.dart';
import 'package:openaiapp/screen/home_page.dart';
import 'package:openaiapp/widgets/custom_appbar.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeHome:
        return MaterialPageRoute(builder: (_) => const HomePage());

      default:
        return MaterialPageRoute(
            builder: (_) => const SafeArea(
                  child: Scaffold(
                    appBar: CustomAppBar(title: "Eror 404"),
                    body: Text("Page not found"),
                  ),
                ));
    }
  }
}
