import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_metro/core/utilities/app_font_family.dart';
import 'package:go_metro/core/utilities/app_text_style.dart';

class FavStationRow extends StatelessWidget {
  const FavStationRow({super.key, required this.color, required this.station});
  final Color color;
  final String station;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.sizeOf(context).width - 160) / 2,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(radius: 8, backgroundColor: color),
          const Gap(10),
          Expanded(
            child: Text(
              station,
              style: AppTextStyle.medium16.copyWith(
                fontFamily: AppFontFamily.inter,
              ),
              softWrap: true,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
