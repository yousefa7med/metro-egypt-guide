import 'package:flutter/material.dart';
import 'package:metro_egypt_guide/core/Helper/metro_helper/models/station_model.dart';
import 'package:metro_egypt_guide/core/utilities/app_color.dart';
import 'package:metro_egypt_guide/generated/l10n.dart';

class TripDetailsModel {
  String? startStation;
  String? finalStation;

  int? stationCount;
  double time;
  int? ticketPrice;
  int? transfer;
  List<List<StationModel>> routes = [];
  Set<StationModel> directions = {};

  TripDetailsModel({
    this.startStation,
    this.finalStation,
    this.stationCount,
    this.time = 0,
    this.transfer,
    this.ticketPrice,
  });

  Map<String, dynamic> toMap() {
    return {
      'startStation': startStation,
      'finalStation': finalStation,
      'stationCount': stationCount,
      'time': time,
      'ticketPrice': ticketPrice,
      'transfer': transfer,
      'routes': routes
          .map((route) => route.map((station) => station.toMap()).toList())
          .toList(),
      'directions': directions.map((station) => station.toMap()).toList(),
    };
  }

  factory TripDetailsModel.fromMap(Map<String, dynamic> map) {
    final TripDetailsModel model = TripDetailsModel();

    model.startStation = map['startStation'];
    model.finalStation = map['finalStation'];
    model.stationCount = map['stationCount'];
    model.time = map['time'];
    model.ticketPrice = map['ticketPrice'];
    model.transfer = map['transfer'];
    if (map['routes'] != null) {
      model.routes = (map['routes'] as List<List<StationModel>>)
          .map(
            (route) => (route as List)
                .map((station) => StationModel.fromMap(station))
                .toList(),
          )
          .toList();
    }
    if (map['directions'] != null) {
      model.directions = (map['directions'] as List)
          .map((station) => StationModel.fromMap(station))
          .toSet();
    }

    return model;
  }

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

  static String getLine(Color lineColor) {
    if (AppColor.line1Color == lineColor) {
      return S.current.Line1;
    } else if (AppColor.line2Color == lineColor) {
      return S.current.Line2;
    } else if (AppColor.line3Color == lineColor) {
      return S.current.Line3;
    }
    return S.current.Line3;
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

  void line3Handeling() {
    for (var i = 1; i < routes.length; i++) {
      routes[i][0].name == "Kit-Kat";
    }
  }
}
