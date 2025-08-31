import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:metro_egypt_guide/core/utilities/app_font_family.dart';
import 'package:metro_egypt_guide/core/utilities/app_text_style.dart';
import 'package:metro_egypt_guide/core/widgets/costum_app_bar.dart';
import 'package:metro_egypt_guide/features/settings/presentation/widgets/change_theme_srectiona.dart';
import 'package:metro_egypt_guide/generated/l10n.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CostumAppBar(
        title: Text(
          S.of(context).Settings,
          style: AppTextStyle.regular20.copyWith(
            fontFamily: AppFontFamily.inter,
          ),
        ),
      ),

      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gap(10),
          
ChangeThemeSection(),



        ],
      ),
    );
  }
}
