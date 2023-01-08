// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:openaiapp/constants/app_color.dart';
import 'package:openaiapp/constants/font_size.dart';
import 'package:openaiapp/constants/font_weight.dart';
import 'package:openaiapp/extensions/text_style_extension.dart';

class Customtextfield extends StatefulWidget {
  final String title, hintText;
  final String? Function(String?)? validator;
  final bool isRequired, readOnly;
  final bool? icon;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? textInputFormatter;
  final Widget prefix;
  final bool hasBottomSpace;
  final IconData? suffixIcon;
  final double? contentPaddingLeft, borderRadius;
  final TextStyle? titleStyle;
  const Customtextfield({
    Key? key,
    this.icon,
    this.title = '',
    this.maxLength = 1,
    this.hintText = '',
    this.isRequired = false,
    this.textCapitalization = TextCapitalization.sentences,
    this.controller,
    this.readOnly = false,
    this.validator,
    this.keyboardType = TextInputType.name,
    this.textInputFormatter,
    this.hasBottomSpace = true,
    this.suffixIcon,
    this.contentPaddingLeft,
    this.borderRadius = 10,
    this.prefix = const SizedBox(),
    this.titleStyle,
  }) : super(
          key: key,
        );

  @override
  State<Customtextfield> createState() => _CustomtextfieldState();
}

class _CustomtextfieldState extends State<Customtextfield> {
  TextStyle style = const TextStyle();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            widget.title.isEmpty
                ? const SizedBox()
                : Row(
                    children: [
                      Text(
                        widget.title,
                        style: widget.titleStyle ??
                            style.font14.w4.tSecondary.copyWith(height: 0),
                      ),
                      widget.isRequired
                          ? Text(
                              '*',
                              style: style.font14.w4.tSecondary
                                  .copyWith(height: 0),
                            )
                          : const SizedBox()
                    ],
                  ),
          ],
        ),
        widget.title.isEmpty
            ? const SizedBox()
            : SizedBox(
                height: 4.0.h,
              ),
        TextFormField(
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: widget.textInputFormatter,
          maxLines: widget.maxLength,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          textCapitalization: widget.textCapitalization,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          readOnly: widget.readOnly,
          style: style.tBlack,
          decoration: InputDecoration(
            hintText: widget.hintText,
            contentPadding: EdgeInsets.fromLTRB(
                widget.contentPaddingLeft ?? 8.0, 8.0, 8.0, 8.0),
            // isDense: true,
            prefix: widget.prefix,
            suffixIcon: Icon(widget.suffixIcon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius!),
            ),
            hintStyle: style.font16.w4.tGrey_400,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kgrayShade1, width: 1.0),
              borderRadius: BorderRadius.circular(widget.borderRadius!),
            ),
          ),
          onChanged: widget.validator,
          validator: widget.validator,
        ),
        widget.hasBottomSpace
            ? SizedBox(
                height: 24.0.h,
              )
            : const SizedBox(),
        // SizedBox(height: 40.h),
      ],
    );
  }
}
