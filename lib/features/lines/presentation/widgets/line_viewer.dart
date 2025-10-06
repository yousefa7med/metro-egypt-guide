import 'package:flutter/material.dart';
import 'package:go_metro/core/Helper/metro_helper/models/station_model.dart';
import 'package:go_metro/core/widgets/routeViewer.dart';
import 'package:go_metro/core/widgets/station_row.dart';

class LineViewer extends StatelessWidget {
  const LineViewer({super.key, required this.line, required this.name});
  final String name;
  final List<StationModel> line;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Colors.grey, width: 1),
        ),
        title: StationRow(color: line[0].lineColor!, station: name),
        children: [RouteViewer(route: line)],
      ),
    );
  }
}
