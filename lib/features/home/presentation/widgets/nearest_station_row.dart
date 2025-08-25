import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:metro_egypt_guide/core/utilities/app_color.dart';
import 'package:metro_egypt_guide/core/utilities/app_font_family.dart';
import 'package:metro_egypt_guide/core/utilities/app_text_style.dart';

class NearestStationRow extends StatelessWidget {
  const NearestStationRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Gap(45),
        const CircleAvatar(radius: 8, backgroundColor: AppColor.line1Color),
        const Gap(10),
        Text(
          'Imbaba',
          style: AppTextStyle.medium16.copyWith(
            fontFamily: AppFontFamily.inter,
          ),
        ),
      ],
    );
  }
}
