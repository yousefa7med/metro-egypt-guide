import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:metro_egypt_guide/core/Helper/metro_helper/models/station_model.dart';
import 'package:metro_egypt_guide/core/utilities/app_font_family.dart';
import 'package:metro_egypt_guide/core/utilities/app_text_style.dart';
import 'package:metro_egypt_guide/core/widgets/align_text.dart';
import 'package:metro_egypt_guide/core/widgets/app_button.dart';
import 'package:metro_egypt_guide/core/widgets/app_card.dart';
import 'package:metro_egypt_guide/core/widgets/app_dropdown_menu.dart';
import 'package:metro_egypt_guide/features/home/controller/trip_cubit/trip_cubit.dart';
import 'package:metro_egypt_guide/generated/l10n.dart';

class FindRouteSection extends StatelessWidget {
  const FindRouteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripCubit, TripState>(
      builder: (context, state) {
        return AppCard(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AlignText(
                  child: Text(
                    S.of(context).FindRoute,
                    style: AppTextStyle.semiBold16.copyWith(
                      fontFamily: AppFontFamily.inter,
                    ),
                  ),
                ),
                const Gap(10),
                AlignText(child: Text(S.of(context).startStation)),
                const Gap(10),
                AppDropdownMenu(
                  controller: TripCubit.get(context).startStationController,
                  hintText: S.of(context).startStation,
                  dropdownMenuEntry: TripCubit.get(context).startStationList,
                  onSelected: TripCubit.get(
                    context,
                  ).startStationsOnSelectedFunction(context),
                  //                (value) {
                  //   value = TripCubit.get(context).startStationController.text;
                  //   TripCubit.get(context).lastFinalStation ??= StationModel();

                  //   if (TripCubit.get(context).lastFinalStation!.name != null &&
                  //       !TripCubit.get(context).startStationList.any(
                  //         (e) => e.value == TripCubit.get(context).lastFinalStation!.name,
                  //       )) {
                  //     TripCubit.get(context).startStationList.insert(
                  //       TripCubit.get(context).lastFinalStation!.index!,
                  //       DropdownMenuEntry(
                  //         value: TripCubit.get(context).lastFinalStation!.name!,
                  //         label: TripCubit.get(context).lastFinalStation!.name!,
                  //       ),
                  //     );
                  //   }

                  //   TripCubit.get(context).lastFinalStation!.name = value;
                  //   TripCubit.get(context).lastFinalStation!.index = TripCubit.get(
                  //     context,
                  //   ).startStationList.indexWhere((e) => e.value == value);

                  //   TripCubit.get(
                  //     context,
                  //   ).startStationList.removeWhere((e) => e.value == value);
                  // }
                ),
                const Gap(10),
                AlignText(child: Text(S.of(context).finalStation)),
                const Gap(10),
                AppDropdownMenu(
                  controller: TripCubit.get(context).finalStationController,
                  hintText: S.of(context).finalStation,
                  dropdownMenuEntry: TripCubit.get(context).finalStationList,
                  onSelected: TripCubit.get(
                    context,
                  ).finalStationsOnSelectedFunction(context),
                  // onSelected: (value) {
                  //   value = TripCubit.get(context).finalStationController.text;
                  //   TripCubit.get(context).lastFinalStation ??= StationModel();

                  //   if (TripCubit.get(context).lastFinalStation!.name != null &&
                  //       !TripCubit.get(context).startStationList.any(
                  //         (e) =>
                  //             e.value ==
                  //             TripCubit.get(context).lastFinalStation!.name,
                  //       )) {
                  //     TripCubit.get(context).startStationList.insert(
                  //       TripCubit.get(context).lastFinalStation!.index!,
                  //       DropdownMenuEntry(
                  //         value: TripCubit.get(context).lastFinalStation!.name!,
                  //         label: TripCubit.get(context).lastFinalStation!.name!,
                  //       ),
                  //     );
                  //   }

                  //   TripCubit.get(context).lastFinalStation!.name = value;
                  //   TripCubit.get(
                  //     context,
                  //   ).lastFinalStation!.index = TripCubit.get(
                  //     context,
                  //   ).startStationList.indexWhere((e) => e.value == value);

                  //   TripCubit.get(
                  //     context,
                  //   ).startStationList.removeWhere((e) => e.value == value);
                  // },
                ),
                const Gap(30),
                AppButton(
                  onPressed: () {},
                  child: Text(
                    S.of(context).FindRoute,
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
    );
  }
}
