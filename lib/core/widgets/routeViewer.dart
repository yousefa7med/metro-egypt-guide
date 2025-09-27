import 'package:flutter/material.dart';
import 'package:metro_egypt_guide/core/Helper/metro_helper/models/station_model.dart';
import 'package:metro_egypt_guide/core/utilities/app_text_style.dart';
import 'package:metro_egypt_guide/core/widgets/app_card.dart';
import 'package:timeline_tile/timeline_tile.dart';

class RouteViewer extends StatelessWidget {
  const RouteViewer({super.key, required this.route});
  final List<StationModel> route;
  @override
  Widget build(BuildContext context) {
    final color = route[0].lineColor!;
    return AppCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
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
                child: Text(route[index].name!, style: AppTextStyle.medium14),
              ),
            );
          },
        ),
      ),
    );
  }
}
