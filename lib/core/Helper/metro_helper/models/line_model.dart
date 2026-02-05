import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_metro/core/Helper/metro_helper/models/station_model.dart';

class LineModel extends Equatable {
  final List<StationModel> stations;
  final int lineColorValue;
  final String lineName;

  const LineModel({
    required this.lineColorValue,
    required this.lineName,
    required this.stations,
  });

  factory LineModel.fromJson({
    required final Map<String, dynamic> json,
    required final String linekey,
  }) {
    final jsonLine = json[linekey] as Map<String, dynamic>;

    return LineModel(
      lineColorValue: jsonLine['lineColorValue'] as int,
      lineName: jsonLine["lineName"]['en'] as String,
      stations: (jsonLine['stations'] as List)
          .map((e) => StationModel.fromJson(json: e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [stations, lineColor, lineName];

  Color get lineColor => Color(lineColorValue);
}

late final LineModel line1;
late final LineModel line2;
late final LineModel line3Main;
late final LineModel line3Branch1;
late final LineModel line3Branch2;

late final List<StationModel> commonStations;
