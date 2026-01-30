import 'package:flutter/material.dart';
import 'package:go_metro/core/Helper/metro_helper/models/station_model.dart';
import 'package:go_metro/core/utilities/app_text_style.dart';
import 'package:go_metro/core/widgets/app_card.dart';
import 'package:timeline_tile/timeline_tile.dart';

class AppTimeLineTile extends StatelessWidget {
  const AppTimeLineTile({super.key, required this.index, required this.stations, required this.color});
  final int index;
  final List<StationModel> stations;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: index == 0,
      isLast: index == stations.length - 1,
      indicatorStyle:  IndicatorStyle(color: color),
      beforeLineStyle:  LineStyle(color: color),
      afterLineStyle:  LineStyle(color: color),
      endChild: AppCard(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
          stations[index].getStationName()!,
            style: AppTextStyle.medium14,
          ),
        ),
      ),
    );
  }
}
