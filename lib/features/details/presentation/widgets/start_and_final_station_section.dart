import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:metro_egypt_guide/core/Helper/metro_helper/models/trip_details_model.dart';
import 'package:metro_egypt_guide/core/utilities/app_color.dart';
import 'package:metro_egypt_guide/core/widgets/app_card.dart';
import 'package:metro_egypt_guide/features/details/presentation/widgets/station_container.dart';

class StartAndFinalStationSection extends StatelessWidget {
  const StartAndFinalStationSection({
    super.key,
    required this.start,
    required this.end,
  });
  final String start;
  final String end;
  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            StationContainer(
              title: "From",
              station: start,
              color: AppColor.line2Color,
              line: TripDetailsModel.getLine(AppColor.line2Color ),
            ),
            const Gap(15),
            StationContainer(
              title: "To",
              station: end,
              color: AppColor.line3Color,
              line: TripDetailsModel.getLine(AppColor.line3Color),
            ),
          ],
        ),
      ),
    );
  }
}
