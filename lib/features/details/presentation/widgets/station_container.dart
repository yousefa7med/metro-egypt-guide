import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:metro_egypt_guide/core/utilities/app_text_style.dart';
import 'package:metro_egypt_guide/core/widgets/station_row.dart';
import 'package:metro_egypt_guide/features/home/presentation/widgets/app_icon.dart';

class StationContainer extends StatelessWidget {
  const StationContainer({
    super.key,
    required this.title,
    required this.station,
    required this.color,
    required this.line,
  });
  final String title;
  final String line;
  final String station;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 300.w,

      decoration: BoxDecoration(
        color: color.withAlpha(29),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Gap(20),
          AppIcon(
            icon: const Icon(Icons.location_on_outlined),
            backgroundColorIcon: color,
          ),
          const Gap(25),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: AppTextStyle.bold18),
              Text(station, style: AppTextStyle.medium16),
              StationRow(color: color, station: line),
            ],
          ),
        ],
      ),
    );
  }
}
