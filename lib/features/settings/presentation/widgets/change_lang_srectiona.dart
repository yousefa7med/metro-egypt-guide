import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_metro/core/utilities/app_color.dart';

import 'package:go_metro/core/widgets/app_card.dart';
import 'package:go_metro/features/home/presentation/widgets/app_icon.dart';
import 'package:go_metro/features/settings/presentation/widgets/change_lang_column.dart';
import 'package:go_metro/features/settings/presentation/widgets/settings_sections_title.dart';
import 'package:go_metro/generated/l10n.dart';

class ChangeLangSection extends StatelessWidget {
  const ChangeLangSection({super.key});

  @override
  Widget build(BuildContext context) {
        final s = S.of(context);

    return AppCard(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SettingsSectionsTitle(
              icon: AppIcon(
                icon: const Icon(
                  Icons.language_outlined,
                  color: AppColor.langIconColor,
                ),
                backgroundColorIcon: AppColor.langIconColor.withAlpha(29),
              ),
              title: s.lang,
              subTitle:s.selectLang,
            ),
            const Gap(20),
            const ChangeLangColumn(),
          ],
        ),
      ),
    );
  }
}
