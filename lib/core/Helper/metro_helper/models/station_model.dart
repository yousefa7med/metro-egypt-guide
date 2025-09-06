import 'package:flutter/material.dart';
import 'package:metro_egypt_guide/core/utilities/app_color.dart';
import 'package:metro_egypt_guide/generated/l10n.dart';

class StationModel {
   String? name;
  int? index;
   double? longitudee;
   double? latitude;
   Color? lineColor;
  StationModel({ this.name,  this.latitude,  this.longitudee,  this.lineColor});
    static String getLine(Color lineColor, BuildContext context) {
    if (AppColor.line1Color == lineColor) {
      return S.of(context).Line1;
    } else if (AppColor.line2Color == lineColor) {
      return S.of(context).Line2;
    } else if (AppColor.line3Color == lineColor) {
      return S.of(context).Line3;
    }
    return S.of(context).Line3;
  }
}
