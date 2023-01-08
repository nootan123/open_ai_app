import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:openaiapp/constants/app_color.dart';
import 'package:openaiapp/widgets/custom_appbar.dart';
import 'package:openaiapp/widgets/custom_textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Home page", hasBackButton: false),
      body: SingleChildScrollView(
          child: Column(children: [
        Text("hello"),
      ])),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 295.w, height: 95.h, child: Customtextfield()),
            Padding(
              padding: EdgeInsets.only(bottom: 40.0.h),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.send, size: 30, color: kOrange_500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
