import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_metro/core/Helper/metro_helper/models/trip_details_model.dart';
import 'package:go_metro/core/navigations/navigations.dart';

import 'package:go_metro/core/utilities/app_font_family.dart';
import 'package:go_metro/core/utilities/app_text_style.dart';
import 'package:go_metro/core/widgets/align_text.dart';
import 'package:go_metro/core/widgets/app_button.dart';
import 'package:go_metro/core/widgets/app_card.dart';

import 'package:go_metro/core/widgets/costum_app_bar.dart';
import 'package:go_metro/core/widgets/routeViewer.dart';
import 'package:go_metro/core/widgets/station_row.dart';
import 'package:go_metro/features/details/presentation/widgets/details_section.dart';
import 'package:go_metro/features/details/presentation/widgets/start_and_final_station_section.dart';

import 'package:go_metro/generated/l10n.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          child: Column(
            spacing: 15,
            children: [
              const Gap(0.0005),

              StartAndFinalStationSection(
                start: details.getStationName(Station.start)!,
                end: details.getStationName(Station.last)!,
                startLine: TripDetailsModel.getLineByColor(
                  details.routes[0][0].lineColor!,
                ),
                startColor: details.routes[0][0].lineColor!,
                lastLine: TripDetailsModel.getLineByColor(
                  details.routes[details.routes.length - 1][0].lineColor!,
                ),
                lastColor:
                    details.routes[details.routes.length - 1][0].lineColor!,
              ),
              DetailsSection(
                time: details.time.ceil(),
                price: details.ticketPrice!,
                transfer: details.transfer!,
                stationCount: details.stationCount!,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: details.routes.length,

                itemBuilder: (context, index) {
                  return AppCard(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: RouteViewer(route: details.routes[index]),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      const Gap(15),

                      AppCard(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            spacing: 10,
                            children: [
                              StationRow(
                                color: details.routes[index].last.lineColor!,
                                station:
                                    "${S.of(context).transferFrom} ${details.routes[index].last.getStationName()}",
                              ),

                              AlignText(
                                child: Text(
                                  "${details.routes[index].last.transferBetween} ",
                                  style: AppTextStyle.medium14.copyWith(
                                    fontSize: 16,
                                    fontFamily: AppFontFamily.roboto,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(15),
                    ],
                  );
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

            Gap(15.h),
            ],
          ),
        ),
      ),
    );
  }
}
