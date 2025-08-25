import 'package:flutter/material.dart';
import 'package:metro_egypt_guide/core/utilities/app_color.dart';
import 'package:metro_egypt_guide/core/utilities/app_font_family.dart';
import 'package:metro_egypt_guide/core/utilities/app_text_style.dart';

import 'package:metro_egypt_guide/core/widgets/costum_app_bar.dart';
import 'package:metro_egypt_guide/core/widgets/app_card.dart';
import 'package:metro_egypt_guide/features/home/presentation/widgets/app_icon.dart';
import 'package:metro_egypt_guide/features/home/presentation/widgets/nearest_station_row.dart';
import 'package:metro_egypt_guide/generated/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 13, 13, 214),
      appBar: const CostumAppBar(title: Text('Metro Guide')),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppCard(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      Text(
                        S.of(context).nearestStation,
                        style: AppTextStyle.semiBold18.copyWith(
                          fontFamily: AppFontFamily.inter,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const AppIcon(
                          icon: Icon(
                            Icons.location_on,
                            color: AppColor.primaryColor,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const NearestStationRow(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
