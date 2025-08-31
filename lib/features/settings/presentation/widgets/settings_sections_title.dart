import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:metro_egypt_guide/core/utilities/app_font_family.dart';
import 'package:metro_egypt_guide/core/utilities/app_text_style.dart';
import 'package:metro_egypt_guide/features/home/presentation/widgets/app_icon.dart';

class SettingsSectionsTitle extends StatelessWidget {
  const SettingsSectionsTitle({super.key, required this.icon, required this.title, required this.subTitle});
  final AppIcon icon;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       icon,
        const Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyle.semiBold16.copyWith(
                fontFamily: AppFontFamily.inter,
              ),
            ),
            Text(
            subTitle,
              style: const TextStyle(fontFamily: AppFontFamily.inter),
            ),
          ],
        ),
      ],
    );
  }
}
