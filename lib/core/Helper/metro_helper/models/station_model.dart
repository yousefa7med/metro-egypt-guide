import 'package:flutter/material.dart';

class StationModel {
  final String name;
  int? index;
  final double longitudee;
  final double latitude;
  final Color lineColor;
  StationModel({required this.name, required this.latitude, required this.longitudee, required this.lineColor});
}
