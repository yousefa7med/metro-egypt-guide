import 'package:flutter/material.dart';
import 'package:go_metro/core/Helper/metro_helper/models/station_model.dart';
import 'package:go_metro/core/utilities/app_text_style.dart';
import 'package:timeline_tile/timeline_tile.dart';

class RouteViewer extends StatelessWidget {
  const RouteViewer({super.key, required this.route});
  final List<StationModel> route;
  @override
  Widget build(BuildContext context) {
    final color = route[0].lineColor!;
    return ListView.builder(
      shrinkWrap: true,

      physics: const NeverScrollableScrollPhysics(),
      itemCount: route.length,
      itemBuilder: (context, index) {
        return TimelineTile(
          isFirst: index == 0,
          isLast: index == route.length - 1,
          indicatorStyle: IndicatorStyle(color: color),
          beforeLineStyle: LineStyle(color: color),
          afterLineStyle: LineStyle(color: color),
          endChild: Container(
            padding: const EdgeInsets.all(16),
            margin: EdgeInsets.only(
              left: 8,
              bottom: index == route.length - 1 ? 0 : 16,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha((0.05 * 255).toInt()),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(route[index].getStationName()!, style: AppTextStyle.medium14),
          ),
        );
      },
    );
  }
}
