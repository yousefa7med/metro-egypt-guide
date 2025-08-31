import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:metro_egypt_guide/core/controllers/theme_cubit/theme_cubit.dart';
import 'package:metro_egypt_guide/core/utilities/app_color.dart';

import 'package:metro_egypt_guide/core/widgets/app_card.dart';
import 'package:metro_egypt_guide/features/home/presentation/widgets/app_icon.dart';
import 'package:metro_egypt_guide/features/settings/presentation/widgets/lang_container.dart';
import 'package:metro_egypt_guide/features/settings/presentation/widgets/settings_sections_title.dart';
import 'package:metro_egypt_guide/generated/l10n.dart';

class ChangeLangSection extends StatelessWidget {
  const ChangeLangSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SettingsSectionsTitle(
              icon: const AppIcon(
                icon: Icon(Icons.language_outlined),
                backgroundColorIcon: AppColor.backgroundLangColor,
              ),
              title: S.of(context).lang,
              subTitle: S.of(context).selectLang,
            ),
            const Gap(20),

            LangContainer(
              langCode: "En",
              langName: S.of(context).English,
              onTap: () {
                AppCubit.get(context).setLang('en');
              },
            ),
            const Gap(15),
            LangContainer(
              langCode: "Ar",
              langName: S.of(context).Arabic,
              onTap: () {
                AppCubit.get(context).setLang('ar');
              },
            ),
          ],
        ),
      ),
    );
  }
}
