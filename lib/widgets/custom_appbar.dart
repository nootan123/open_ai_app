import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:openaiapp/constants/app_color.dart';
import 'package:openaiapp/extensions/text_style_extension.dart';
import 'package:openaiapp/main.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Widget? bottom;
  final bool hasBackButton;
  final List<Widget>? action;
  const CustomAppBar(
      {Key? key,
      required this.title,
      this.bottom,
      this.action,
      this.hasBackButton = true})
      : super(key: key);
  @override
  Size get preferredSize => (bottom != null)
      ? const Size.fromHeight(kToolbarHeight + 30)
      : const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle();
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      titleSpacing: 16.0.w,
      backgroundColor: kOrange_500,
      title: Text(title, style: style.font20.w7),
      actions: action,
      leading: hasBackButton
          ? IconButton(
              onPressed: () {
                navigationKey.currentState?.pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: kWhite,
              ),
            )
          : null,
      bottom: PreferredSize(
        preferredSize: (bottom != null)
            ? Size.fromHeight(108.0 - MediaQuery.of(context).viewPadding.top)
            : Size.zero,
        child: bottom ?? const SizedBox(),
      ),
    );
  }
}
