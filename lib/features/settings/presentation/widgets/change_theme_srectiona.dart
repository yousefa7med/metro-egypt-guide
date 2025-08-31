import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:metro_egypt_guide/core/controllers/theme_cubit/theme_cubit.dart';
import 'package:metro_egypt_guide/core/utilities/app_color.dart';

import 'package:metro_egypt_guide/core/widgets/app_card.dart';
import 'package:metro_egypt_guide/features/home/presentation/widgets/app_icon.dart';
import 'package:metro_egypt_guide/features/settings/presentation/widgets/settings_sections_title.dart';
import 'package:metro_egypt_guide/features/settings/presentation/widgets/theme_container.dart';
import 'package:metro_egypt_guide/generated/l10n.dart';

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
            SettingsSectionsTitle(icon: const AppIcon(
                  icon: Icon(Icons.color_lens),
                  backgroundColorIcon: AppColor.backgroundThemeColor,
                ),
                title:    S.of(context).Theme,
                subTitle:    S.of(context).preTheme,
                )
         ,
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ThemeContainer(
                  icon: const Icon(
                    Icons.light_mode_outlined,
                    color: Colors.amber,
                    size: 34,
                  ),
                  themeType: S.of(context).Light,
                  onTap: () {
                    AppCubit.get(context).setTheme(ThemeModeState.light);
                  },
                ),
                const Gap(10),
                ThemeContainer(
                  icon: const Icon(
                    Icons.dark_mode_outlined,
                    size: 34,
                    color: Colors.blue,
                  ),
                  themeType: S.of(context).Dark,

                  onTap: () {
                    AppCubit.get(context).setTheme(ThemeModeState.dark);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
