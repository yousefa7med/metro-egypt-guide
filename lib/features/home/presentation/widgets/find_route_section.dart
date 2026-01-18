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
import 'package:go_metro/core/widgets/align_text.dart';
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
    print('rebuild finddddddddddddddddddd');
    return BlocListener<AppCubit, AppState>(
      listener: (context, state) {
        if (state is LocalizationChangesState) {
          print(" initttttttttttttttttttttttttttttttt");
          TripCubit.get(context).init();
        }
      },
      child: BlocBuilder<TripCubit, TripState>(
        buildWhen: (prev, curr) {
          return curr is PositionSuccessState ||
              curr is TripDetailsChangesState;
        },
        builder: (context, state) {
          return AppCard(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AlignText(
                    child: Text(
                      s.FindRoute,
                      style: AppTextStyle.semiBold16.copyWith(
                        fontFamily: AppFontFamily.inter,
                      ),
                    ),
                  ),
                  const Gap(10),
                  AlignText(child: Text(s.startStation)),
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
                  AlignText(child: Text(s.finalStation)),
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
                    onPressed: () {
                      TripDetailsModel? details;
                      try {
                        details = TripCubit.get(context).getTripDetails();

                        for (var element in details.directions) {
                          print(element.name);
                        }

                        AppNavigation.pushName(
                          rootNavigator: true,
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
