import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_metro/core/utilities/app_font_family.dart';
import 'package:go_metro/core/utilities/app_text_style.dart';

class StationRow extends StatelessWidget {
  const StationRow({super.key, required this.color, required this.station});
  final Color color;
  final String station;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 8, backgroundColor: color),
        const Gap(10),
        Text(
          station,
          style: AppTextStyle.medium16.copyWith(
            fontFamily: AppFontFamily.inter,
          ),
        ),
      ],
    );
  }
}
