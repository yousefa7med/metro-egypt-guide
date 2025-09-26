import 'package:flutter/material.dart';
import 'package:metro_egypt_guide/core/Helper/metro_helper/models/station_model.dart';
import 'package:metro_egypt_guide/core/utilities/app_color.dart';
import 'package:metro_egypt_guide/generated/l10n.dart';

class TripDetailsModel {
  String? startStation;
  String? finalStation;

  int? stationCount;
  int? time;
  int? ticketPrice;
  List<List<StationModel>> routes = [];
  Set<StationModel> directions = {};

  void clear() {
    directions.clear();
    routes.clear();
    stationCount = null;
    time = null;
    ticketPrice = null;
    startStation = null;
    finalStation = null;
  }

  void setStationCount(int stationCount) => this.stationCount = stationCount;

  void setTicketPrice(int numOfStation) {
    if (numOfStation <= 9) {
      ticketPrice = 8;
    } else if (numOfStation <= 16) {
      ticketPrice = 10;
    } else if (numOfStation <= 23) {
      ticketPrice = 15;
    } else {
      ticketPrice = 20;
    }
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

  void printDetails() {
    print(
      '============================================= routes =========================================',
    );
    for (var route in routes) {
      print(
        '=============================================== route =======================================',
      );
      for (var station in route) {
        print(station.name);
      }
    }

    for (var direction in directions) {
      print(
        '=============================================== direction =======================================',
      );

      print(direction.name);
    }
  }
}
