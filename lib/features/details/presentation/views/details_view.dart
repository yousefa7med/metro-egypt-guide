import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_metro/core/Helper/functions/functions.dart';
import 'package:go_metro/core/Helper/metro_helper/models/trip_details_model.dart';
import 'package:go_metro/core/navigations/navigations.dart';

import 'package:go_metro/core/utilities/app_font_family.dart';
import 'package:go_metro/core/utilities/app_text_style.dart';

import 'package:go_metro/core/widgets/app_button.dart';
import 'package:go_metro/core/widgets/app_card.dart';
import 'package:go_metro/core/widgets/app_time_line_tile.dart';

import 'package:go_metro/core/widgets/costum_app_bar.dart';
import 'package:go_metro/core/widgets/station_row.dart';
import 'package:go_metro/features/details/presentation/widgets/details_section.dart';
import 'package:go_metro/features/details/presentation/widgets/start_and_final_station_section.dart';

import 'package:go_metro/generated/l10n.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    final TripDetailsModel details =
        ModalRoute.of(context)!.settings.arguments as TripDetailsModel;
    return Scaffold(
      appBar: CostumAppBar(
        backArrow: true,
        title: Text(
          s.routeDetails,
          style: AppTextStyle.regular20.copyWith(
            color: Colors.white,
            fontFamily: AppFontFamily.inter,
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(child: Gap(20)),

            SliverToBoxAdapter(
              child: StartAndFinalStationSection(
                start: details.stationName(details.startStation!)!,
                end: details.stationName(details.finalStation!)!,
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
            ),
            const SliverToBoxAdapter(child: Gap(15)),

            SliverToBoxAdapter(
              child: DetailsSection(
                time: details.time.ceil(),
                price: details.ticketPrice!,
                transfer: details.transfer!,
                stationCount: details.stationCount!,
              ),
            ),
            const SliverToBoxAdapter(child: Gap(15)),

            SliverList.builder(
              itemCount: details.routes.length - 1,
              itemBuilder: (context, index) => AppCard(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      StationRow(
                        color: details.routes[index].last.lineColor!,
                        station:
                            "${s.transferFrom} ${details.routes[index].last.getStationName()}",
                      ),

                      Text(
                        "${details.routes[index].last.getStationName()} ${details.routes[index].last.transferBetween} ",
                        style: AppTextStyle.medium14.copyWith(
                          fontSize: 16,
                          fontFamily: AppFontFamily.roboto,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            for (var route in details.routes) ...[
              // المسار نفسه (المحطات) بتعمل Lazy Loading
              SliverPadding(
                sliver: SliverList.builder(
                  itemCount: route.length,
                  itemBuilder: (context, index) {
                    log('builder $index');
                    return AppTimeLineTile(
                      index: index,
                      stations: route,
                      color: route[1].lineColor!,
                    );
                  },
                ),
                padding: isArabic()
                    ? const EdgeInsets.only(right: 16)
                    : const EdgeInsets.only(left: 16),
              ),
            ],

            const SliverToBoxAdapter(child: Gap(15)),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: AppButton(
                  onPressed: () {
                    AppNavigation.pop(context: context);
                  },
                  child: Text(
                    s.backToHome,
                    style: AppTextStyle.regular16.copyWith(
                      fontFamily: AppFontFamily.inter,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: Gap(15.h)),
          ],
        ),
      ),
    );
  }
}

// class FavButton extends StatelessWidget {
//   const FavButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final s = S.of(context);
//     return BlocBuilder<TripCubit, TripState>(
//       buildWhen: (previous, current) =>
//           current is AddToFavoutiteState || current is RemoveFromFavoutiteState,
//       builder: (context, state) {
//         return OutlinedButton(
//           style: OutlinedButton.styleFrom(
//             side: const BorderSide(color: AppColor.primaryColor, width: 3),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadiusGeometry.circular(12),
//             ),
//           ),
//           onPressed: () {
//             // isFav = !isFav;
//           },
//           child: SizedBox(
//             height: 35.h,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   TripCubit.get(context).isFav
//                       ? Icons.star_outline
//                       : Icons.star,
//                   color: AppColor.primaryColor,
//                   size: 26,
//                 ),
//                 const Gap(4),
//                 Text(
//                   TripCubit.get(context).isFav ? s.remfromFav : s.addToFav,
//                   style: AppTextStyle.medium16.copyWith(
//                     fontFamily: AppFontFamily.inter,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
