import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:metro_egypt_guide/core/Helper/functions/functions.dart';
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
          onTap: () {
            AppCubit.get(context).setLang('en');
            setState(() {
              isAarbic = false;
            });
          },
        ),
        const Gap(15),
        LangContainer(
          langCode: "Ar",
          lang: isAarbic,
          langName: S.of(context).Arabic,
          onTap: () {
            AppCubit.get(context).setLang('ar');
            setState(() {
              isAarbic = true;
            });
          },
        ),
      ],
    );
  }
}
