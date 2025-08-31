import 'package:flutter/material.dart';
import 'package:metro_egypt_guide/core/utilities/app_font_family.dart';
import 'package:metro_egypt_guide/core/utilities/app_text_style.dart';
import 'package:metro_egypt_guide/core/widgets/costum_app_bar.dart';
import 'package:metro_egypt_guide/generated/l10n.dart';

class LinesView extends StatelessWidget {
  const LinesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CostumAppBar(
        title: Text(
          S.of(context).Lines,
          style: AppTextStyle.regular20.copyWith(
            fontFamily: AppFontFamily.inter,
          ),
        ),
      ),

      body: const Center(child: Text('Lines ')),
    );
  }
}
