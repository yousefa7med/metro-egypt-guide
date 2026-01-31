import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_metro/core/Helper/metro_helper/models/station_model.dart';
import 'package:go_metro/core/Helper/mixins/station_name_mixin.dart';
import 'package:go_metro/core/utilities/app_color.dart';
import 'package:go_metro/generated/l10n.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class TripDetailsModel extends Equatable with StationNameMixin {
  @Id()
  int id = 0;
  String? startStation;
  String? finalStation;
  int? startColorValue;
  int? finalColorValue;
  int? stationCount;
  double time;
  int? ticketPrice;
  int? transfer;
  List<List<StationModel>> routes = [];
  Set<StationModel> directions = {};
  bool isFav = false;

  TripDetailsModel({
    this.startStation,
    this.finalStation,
    this.stationCount,
    this.time = 0,
    this.transfer,
    this.ticketPrice,
  });
  Color get startColor => Color(startColorValue!);
  Color get finalColor => Color(finalColorValue!);
  set startColor(Color color) => startColorValue = color.toARGB32();
  set finalColor(Color color) => finalColorValue = color.toARGB32();

  void setColors() {
    startColor = routes[0][1].lineColor!;
    finalColor = routes[routes.length - 1][0].lineColor!;
  }

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
    startColorValue = null;
    finalColorValue = null;
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

  static String getLineByColor(Color lineColor) {
    if (AppColor.line1Color == lineColor) {
      return S.current.Line1;
    } else if (AppColor.line2Color == lineColor) {
      return S.current.Line2;
    } else if (AppColor.line3Color == lineColor) {
      return S.current.Line3;
    }
    return S.current.Line3;
  }

  StationModel getLastStation() {
    return routes[routes.length - 1][routes[routes.length - 1].length - 1];
  }

  // void printDetails() {
  //   print(
  //     '============================================= routes =========================================',
  //   );
  //   for (var route in routes) {
  //     print(
  //       '=============================================== route =======================================',
  //     );
  //     for (var station in route) {
  //       print(station.name);
  //     }
  //   }

  //   for (var direction in directions) {
  //     print(
  //       '=============================================== direction =======================================',
  //     );

  //     print(direction.name);
  //   }
  // }

  void calcTransfer() => transfer = directions.length - 1;

  bool validDetails() {
    return !(routes.isEmpty || directions.isEmpty);
  }

  void calcTime() {
    time = 0;
    for (var route in routes) {
      time += route[0].travellingTime! * route.length;
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    startStation,
    finalStation,
    startColorValue,
    finalColorValue,
    stationCount,
    time,

    ticketPrice,
    transfer,
    routes,
    directions,
    isFav,
  ];
}
