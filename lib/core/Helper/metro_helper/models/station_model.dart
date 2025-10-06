import 'package:flutter/material.dart';
import 'package:go_metro/core/utilities/app_color.dart';
import 'package:go_metro/generated/l10n.dart';

class StationModel {
  String? name;
  int? index;
  double? travellingTime;
  double? longitudee;
  double? latitude;
  Color? lineColor;
  StationModel({
    this.name,
    this.latitude,
    this.longitudee,
    this.lineColor,
    this.index,
    this.travellingTime,
  });
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "index": index,
      "travellingTime": travellingTime,
      "longitudee": longitudee,
      'latitude': latitude,
      'lineColor': lineColor,
    };
  }

  factory StationModel.fromMap(Map<String, dynamic> map) {
    return StationModel(
      name: map["name"],
      index: map["index"],
      travellingTime: map["travellingTime"],
      longitudee: map["longitudee"],
      latitude: map['latitude'],

      lineColor: map['lineColor'],
    );
  }

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
