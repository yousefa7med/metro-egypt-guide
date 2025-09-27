import 'package:flutter/material.dart';
import 'package:metro_egypt_guide/core/Helper/metro_helper/models/station_model.dart';
import 'package:metro_egypt_guide/core/utilities/app_color.dart';
import 'package:metro_egypt_guide/generated/l10n.dart';

class TripDetailsModel {
  String? startStation;
  String? finalStation;

  int? stationCount;
  double time = 0;
  int? ticketPrice;
  int? transfer;
  List<List<StationModel>> routes = [];
  Set<StationModel> directions = {};

  void clear() {
    directions.clear();
    routes.clear();
    stationCount = null;
    time = 0;
    ticketPrice = null;
    startStation = null;
    finalStation = null;
  }

  void calcStationCount(int stationCount) => this.stationCount = stationCount;

  void calcTicketPrice(int numOfStation) {
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

  void calcTransfer() => transfer = directions.length - 1;

  bool validDetails() {
    return !(routes.isEmpty || directions.isEmpty);
  }

  void calcTime() {
    for (var route in routes) {
      time = route[0].travellingTime! * route.length;
    }
  }
}
