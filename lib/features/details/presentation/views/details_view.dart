import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:metro_egypt_guide/core/Helper/metro_helper/models/trip_details_model.dart';
import 'package:metro_egypt_guide/core/navigations/navigations.dart';

import 'package:metro_egypt_guide/core/utilities/app_font_family.dart';
import 'package:metro_egypt_guide/core/utilities/app_text_style.dart';
import 'package:metro_egypt_guide/core/widgets/app_button.dart';

import 'package:metro_egypt_guide/core/widgets/costum_app_bar.dart';
import 'package:metro_egypt_guide/core/widgets/routeViewer.dart';
import 'package:metro_egypt_guide/features/details/presentation/widgets/details_section.dart';
import 'package:metro_egypt_guide/features/details/presentation/widgets/start_and_final_station_section.dart';

import 'package:metro_egypt_guide/generated/l10n.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final TripDetailsModel details =
        ModalRoute.of(context)!.settings.arguments as TripDetailsModel;
    return Scaffold(
      appBar: CostumAppBar(
        backArrow: true,
        title: Text(
          S.of(context).routeDetails,
          style: AppTextStyle.regular20.copyWith(
            color: Colors.white,
            fontFamily: AppFontFamily.inter,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(20),

            StartAndFinalStationSection(
              start: details.startStation!,
              end: details.finalStation!,
            ),
            const Gap(15),
            DetailsSection(
              time: details.time.ceil(),
              price: details.ticketPrice!,
              transfer: details.transfer!,
            ),
            const Gap(30),
            ListView.builder(
              shrinkWrap: true,

              physics: const NeverScrollableScrollPhysics(),
              itemCount: details.routes.length,

              itemBuilder: (context, index) {
                return RouteViewer(route: details.routes[index]);
              },
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

            Gap(45.h),
          ],
        ),
      ),
    );
  }
}
