import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:go_metro/core/utilities/app_color.dart';

import 'package:go_metro/core/widgets/app_card.dart';
import 'package:go_metro/features/home/presentation/widgets/app_icon.dart';
import 'package:go_metro/features/settings/presentation/widgets/change_theme_row.dart';
import 'package:go_metro/features/settings/presentation/widgets/settings_sections_title.dart';
import 'package:go_metro/generated/l10n.dart';

class ChangeThemeSection extends StatelessWidget {
  const ChangeThemeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SettingsSectionsTitle(
              icon: AppIcon(
                icon: const Icon(
                  Icons.color_lens,
                  color: AppColor.themeIconColor,
                ),
                backgroundColorIcon: AppColor.themeIconColor.withAlpha(29),
              ),
              title: S.of(context).Theme,
              subTitle: S.of(context).preTheme,
            ),
            const Gap(20),
            const ChangeThemeRow(),
          ],
        ),
      ),
    );
  }
}
