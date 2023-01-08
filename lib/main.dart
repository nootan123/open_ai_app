import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:openaiapp/constants/app_color.dart';
import 'package:openaiapp/constants/font_size.dart';
import 'package:openaiapp/constants/font_weight.dart';
import 'package:openaiapp/route/router_generator.dart';

final navigationKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375.0, 812.0),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
              fontFamily: "Nexa",
              textTheme: const TextTheme(
                bodyText1: TextStyle(),
                bodyText2: TextStyle(),
              ).apply(
                bodyColor: kSecondary,
                displayColor: Colors.orange,
              ),
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: kOrange_500,
              ),
              // colorScheme: ColorScheme.fromSwatch().copyWith(),
              scaffoldBackgroundColor: kWhite,
              dividerTheme:
                  const DividerThemeData(thickness: 0.5, color: kOrange_500),
              appBarTheme: AppBarTheme(
                color: kOrange_500,
                centerTitle: true,
                iconTheme: const IconThemeData(color: kWhite),
                elevation: 0,
                titleTextStyle: TextStyle(
                  fontSize: font_24,
                  color: kWhite,
                  fontWeight: kW6,
                  fontFamily: "Nexa",
                ),
              ),
            ),
            debugShowCheckedModeBanner: false,
            navigatorKey: navigationKey,
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        });
  }
}

