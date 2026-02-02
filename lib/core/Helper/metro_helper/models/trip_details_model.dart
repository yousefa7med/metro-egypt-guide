import 'package:flutter/material.dart';
import 'package:go_metro/core/Helper/metro_helper/models/station_model.dart';
import 'package:go_metro/core/Helper/mixins/station_name_mixin.dart';
import 'package:go_metro/core/utilities/app_color.dart';
import 'package:go_metro/generated/l10n.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class TripDetailsModel with StationNameMixin {
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
  @Backlink('trip')
  final routes = ToMany<RouteModel>();
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
    if (routes[0].stations.length > 2) {
      startColor = routes[0].stations[1].lineColor;
    } else {
      startColor = routes[0].stations[0].lineColor;
    }
    if (routes[routes.length - 1].stations.length > 2) {
      finalColor = routes[routes.length - 1].stations[1].lineColor;
    } else {
      finalColor = routes[routes.length - 1].stations[0].lineColor;
    }
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
    return routes[routes.length - 1]
        .stations[routes[routes.length - 1].stations.length - 1];
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
      time += route.stations[0].travellingTime! * route.stations.length;
    }
  }

  void setOrder() {
    for (int i = 0; i < routes.length; i++) {
      routes[i].routeOrder = i;
    }
  }
}

@Entity()
class RouteModel {
  @Id()
  int id = 0;

  @Backlink('route')
  final stations = ToMany<StationModel>();

  int routeOrder;

  final trip = ToOne<TripDetailsModel>();
  RouteModel({required this.routeOrder});

  void setOrder() {
    for (int i = 0; i < stations.length; i++) {
      stations[i].order = i;
    }
  }
}
