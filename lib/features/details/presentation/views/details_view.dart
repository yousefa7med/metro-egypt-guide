import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:metro_egypt_guide/core/Helper/metro_helper/models/line_model.dart';
import 'package:metro_egypt_guide/core/navigations/navigations.dart';

import 'package:metro_egypt_guide/core/utilities/app_font_family.dart';
import 'package:metro_egypt_guide/core/utilities/app_text_style.dart';
import 'package:metro_egypt_guide/core/widgets/app_button.dart';
import 'package:metro_egypt_guide/core/widgets/app_card.dart';

import 'package:metro_egypt_guide/core/widgets/costum_app_bar.dart';
import 'package:metro_egypt_guide/core/widgets/routeViewer.dart';
import 'package:metro_egypt_guide/features/details/presentation/widgets/details_section.dart';
import 'package:metro_egypt_guide/features/details/presentation/widgets/start_and_final_station_section.dart';

import 'package:metro_egypt_guide/generated/l10n.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CostumAppBar(
        backArrow: true,
        title: Text(
          S.of(context).routeDetails,
          style: AppTextStyle.regular20.copyWith(
            fontFamily: AppFontFamily.inter,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(20),

            const StartAndFinalStationSection(),
            const Gap(15),
            const DetailsSection(),
            const Gap(30),

            AppCard(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: RouteViewer(route: line3Main.stations),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AppButton(
                onPressed: () {
                  AppNavigation.pop(context: context);
                },
                child: Text(
                  S.of(context).backToHome,
                  style: AppTextStyle.regular16.copyWith(
                    fontFamily: AppFontFamily.inter,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
