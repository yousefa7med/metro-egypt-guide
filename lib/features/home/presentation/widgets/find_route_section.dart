import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_metro/core/Helper/functions/show_snackBer.dart';
import 'package:go_metro/core/Helper/metro_helper/models/trip_details_model.dart';
import 'package:go_metro/core/config/configrations.dart';
import 'package:go_metro/core/controllers/app_cubit/app_cubit.dart';
import 'package:go_metro/core/errors/app_exeption.dart';
import 'package:go_metro/core/navigations/navigations.dart';
import 'package:go_metro/core/utilities/app_font_family.dart';
import 'package:go_metro/core/utilities/app_text_style.dart';
import 'package:go_metro/core/widgets/app_button.dart';
import 'package:go_metro/core/widgets/app_card.dart';
import 'package:go_metro/core/widgets/app_dropdown_menu.dart';
import 'package:go_metro/features/home/controller/trip_cubit/trip_cubit.dart';
import 'package:go_metro/generated/l10n.dart';

class FindRouteSection extends StatelessWidget {
  const FindRouteSection({super.key});
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocListener<AppCubit, AppState>(
      listenWhen: (previous, current) => current is LocalizationChangesState,
      listener: (context, state) {
        print(" in listener  -->${AppCubit.get(context).isArabic}");
        TripCubit.get(context).init(context);
      },
      child: BlocBuilder<TripCubit, TripState>(
        buildWhen: (prev, curr) {
          return curr is PositionSuccessState ||
              curr is TripDetailsChangesState ||
              curr is TripInitialState;
        },
        builder: (context, state) {
          print('find route re build');

          for (var element in TripCubit.get(context).startStationList) {
            log(element.label);
            log('in builder-->   ${AppCubit.get(context).isArabic}');
          }
          print(
            'in builderafter for  -->   ${AppCubit.get(context).isArabic}',
          );

          return AppCard(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    s.FindRoute,
                    style: AppTextStyle.semiBold16.copyWith(
                      fontFamily: AppFontFamily.inter,
                    ),
                  ),
                  const Gap(10),
                  Text(s.startStation),
                  const Gap(10),
                  AppDropdownMenu(
                    controller: TripCubit.get(context).startStationController,
                    hintText: s.startStation,
                    dropdownMenuEntry: TripCubit.get(context).startStationList,
                    onSelected: TripCubit.get(
                      context,
                    ).startStationsOnSelectedFunction(context: context),
                  ),
                  const Gap(10),
                  Text(s.finalStation),
                  const Gap(10),
                  AppDropdownMenu(
                    controller: TripCubit.get(context).finalStationController,
                    hintText: s.finalStation,
                    dropdownMenuEntry: TripCubit.get(context).finalStationList,
                    onSelected: TripCubit.get(
                      context,
                    ).finalStationsOnSelectedFunction(context: context),
                  ),
                  const Gap(30),
                  AppButton(
                    onPressed: () async {
                      TripDetailsModel? details;
                      try {
                        details = TripCubit.get(context).getTripDetails();
                        // await  Navigator.pushNamed(
                        //     context,
                        //     AppRoutes.detailsView,
                        //     arguments: details,
                        //   );
                        AppNavigation.pushName(
                          // rootNavigator: true,
                          context: context,
                          route: AppRoutes.detailsView,
                          argument: details,
                        );
                      } on AppException catch (e) {
                        showSnackBar(context, e.message);
                      }
                    },
                    child: Text(
                      s.FindRoute,
                      style: AppTextStyle.regular16.copyWith(
                        fontFamily: AppFontFamily.inter,
                      ),
                    ),
                  ),
                  const Gap(5),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
