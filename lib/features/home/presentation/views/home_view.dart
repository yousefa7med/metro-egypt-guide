import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import 'package:go_metro/core/utilities/app_font_family.dart';
import 'package:go_metro/core/utilities/app_text_style.dart';

import 'package:go_metro/core/widgets/costum_app_bar.dart';

import 'package:go_metro/features/home/presentation/widgets/find_route_section.dart';
import 'package:go_metro/features/home/presentation/widgets/nearest_station_section.dart';
import 'package:go_metro/generated/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CostumAppBar(
          title: Text(
            S.of(context).metroGuide,
            style: AppTextStyle.regular20.copyWith(
              color: Colors.white,

              fontFamily: AppFontFamily.inter,
            ),
          ),
        ),

        body: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Gap(20),
              NearestStationSection(),
              Gap(15),
              // DestinationSection(),
              Gap(15),
              FindRouteSection(),
            ],
          ),
        ),
      ),
    );
  }
}
