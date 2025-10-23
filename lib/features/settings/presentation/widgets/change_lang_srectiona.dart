import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_metro/core/Helper/functions/functions.dart';
import 'package:go_metro/core/controllers/app_cubit/app_cubit.dart';
import 'package:go_metro/core/utilities/app_color.dart';

import 'package:go_metro/core/widgets/app_card.dart';
import 'package:go_metro/features/home/presentation/widgets/app_icon.dart';
import 'package:go_metro/features/settings/presentation/widgets/lang_container.dart';
import 'package:go_metro/features/settings/presentation/widgets/settings_sections_title.dart';
import 'package:go_metro/generated/l10n.dart';

class ChangeLangSection extends StatelessWidget {
  const ChangeLangSection({super.key});

  @override
  Widget build(BuildContext context) {
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
              title: S.of(context).lang,
              subTitle: S.of(context).selectLang,
            ),
            const Gap(20),
            const ChangeLangColumn(),
          ],
        ),
      ),
    );
  }
}

class ChangeLangColumn extends StatefulWidget {
  const ChangeLangColumn({super.key});

  @override
  State<ChangeLangColumn> createState() => _ChangeLangColumnState();
}

class _ChangeLangColumnState extends State<ChangeLangColumn> {
  late bool isAarbic;
  @override
  void initState() {
    isAarbic = isArabic();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LangContainer(
          langCode: "En",
          lang: !isAarbic,
          langName: S.of(context).English,
          onTap: () async {
            if (isAarbic) {
              setState(() {
                isAarbic = false;
              });
              await AppCubit.get(context).setLang('en');
            }
          },
        ),
        const Gap(15),
        LangContainer(
          langCode: "Ar",
          lang: isAarbic,
          langName: S.of(context).Arabic,
          onTap: () async {
            if (!isAarbic) {
              setState(() {
                isAarbic = true;
              });
              await AppCubit.get(context).setLang('ar');
            }
          },
        ),
      ],
    );
  }
}
