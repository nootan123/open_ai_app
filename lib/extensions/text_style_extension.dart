import 'package:flutter/material.dart';
import 'package:openaiapp/constants/app_color.dart';
import 'package:openaiapp/constants/font_size.dart';
import 'package:openaiapp/constants/font_weight.dart';

extension TextStyleHelpers on TextStyle {
/////////////fontSize
  TextStyle get font10 => copyWith(fontSize: font_10);
  TextStyle get font11 => copyWith(fontSize: font_11);
  TextStyle get font12 => copyWith(fontSize: font_12);
  TextStyle get font13 => copyWith(fontSize: font_13);
  TextStyle get font14 => copyWith(fontSize: font_14);
  TextStyle get font15 => copyWith(fontSize: font_15);
  TextStyle get font16 => copyWith(fontSize: font_16);
  TextStyle get font18 => copyWith(fontSize: font_18);
  TextStyle get font20 => copyWith(fontSize: font_20);
  TextStyle get font24 => copyWith(fontSize: font_24);
  TextStyle get font32 => copyWith(fontSize: font_32);

  /////////////fontweight
  TextStyle get w3 => copyWith(fontWeight: kW3);
  TextStyle get w4 => copyWith(fontWeight: kW4);
  TextStyle get w5 => copyWith(fontWeight: kW5);
  TextStyle get w6 => copyWith(fontWeight: kW6);
  TextStyle get w7 => copyWith(fontWeight: kW7);
  TextStyle get w8 => copyWith(fontWeight: kW8);

///////fontColor
  TextStyle get tOrange_50 => copyWith(color: kOrange_50);
  TextStyle get tOrange_100 => copyWith(color: kOrange_100);
  TextStyle get tOrange_150 => copyWith(color: kOrange_150);
  TextStyle get tOrange_200 => copyWith(color: kOrange_200);
  TextStyle get tOrange_300 => copyWith(color: kOrange_300);
  TextStyle get tOrange_400 => copyWith(color: kOrange_400);
  TextStyle get tOrange_500 => copyWith(color: kOrange_500);
  TextStyle get tOrange_600 => copyWith(color: kOrange_600);
  TextStyle get tOrange_700 => copyWith(color: kOrange_700);
  TextStyle get tOrange_750 => copyWith(color: kOrange_750);
  TextStyle get tOrange_800 => copyWith(color: kOrange_800);
  TextStyle get tOrange_850 => copyWith(color: kOrange_850);
  TextStyle get tOrange_900 => copyWith(color: kOrange_900);
  TextStyle get tBlack => copyWith(color: kBlack);
  TextStyle get tGrey => copyWith(color: kGrey);
  TextStyle get tTableGrey => copyWith(color: kTableGrey);
  TextStyle get tGrey_300 => copyWith(color: kGrey300);

  TextStyle get tGrey_400 => copyWith(color: kGrey400);
  TextStyle get tGrey_600 => copyWith(color: kGrey_600);
  TextStyle get tGrey_700 => copyWith(color: kGrey_700);

  TextStyle get tGreyShade3 => copyWith(color: kgreyShade3);

  TextStyle get tTableGreyDark => copyWith(color: kTableGreyDark);
  TextStyle get tSecondary => copyWith(color: kSecondary);
  TextStyle get tGrayShade1 => copyWith(color: kgrayShade1);
  TextStyle get tGrayShade2 => copyWith(color: kgrayShade2);

  TextStyle get tLightBlue => copyWith(color: kLightBlue);
  TextStyle get tLightBlue1 => copyWith(color: kLightBlue1);
  TextStyle get tLightBlue2 => copyWith(color: kLightBlue2);

  TextStyle get tShipmentBlue => copyWith(color: kShipmentBlue);
  TextStyle get tInfoDef => copyWith(color: kInfoDef);
  TextStyle get tInfo50 => copyWith(color: kInfo50);
  TextStyle get tInfoPrimaryDef => copyWith(color: kInfoPrimaryDef);

  TextStyle get tGreen => copyWith(color: kGreen);
  TextStyle get tSuccessDef => copyWith(color: kSuccessDef);
  TextStyle get tSuccess50 => copyWith(color: kSuccess50);

  TextStyle get tWhite => copyWith(color: Colors.white);
  TextStyle get tLightGreen => copyWith(color: kLightGreen);

  TextStyle get tErrorDef => copyWith(color: kErrorDef);
  TextStyle get tError50 => copyWith(color: kError50);
}
