import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_metro/core/Helper/functions/functions.dart';
import 'package:go_metro/core/Helper/functions/show_snackBer.dart';
import 'package:go_metro/core/Helper/metro_helper/metro_helper.dart';
import 'package:go_metro/core/Helper/metro_helper/models/trip_details_model.dart';
import 'package:go_metro/core/Helper/mixins/station_name_mixin.dart';
import 'package:go_metro/core/config/configrations.dart';
import 'package:go_metro/core/errors/app_exeption.dart';
import 'package:go_metro/core/navigations/navigations.dart';
import 'package:go_metro/core/utilities/app_font_family.dart';
import 'package:go_metro/core/utilities/app_text_style.dart';
import 'package:go_metro/core/widgets/app_button.dart';
import 'package:go_metro/core/widgets/app_dropdown_menu.dart';
import 'package:go_metro/features/home/controller/trip_cubit/trip_cubit.dart';
import 'package:go_metro/generated/l10n.dart';

class FindRouteForm extends StatefulWidget {
  const FindRouteForm({super.key});

  @override
  State<FindRouteForm> createState() => _FindRouteFormState();
}

class _FindRouteFormState extends State<FindRouteForm> with StationNameMixin {
  final List<DropdownMenuEntry<String>> startStationList = [];
  final List<DropdownMenuEntry<String>> finalStationList = [];
  String? lastStartStationName;
  int? lastStartStationIndex;
  String? lastFinalStationName;
  int? lastFinalStationIndex;
  String? startStation;
  String? lastStation;
  String? currentLocale;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    log("message");
    final newLocale = Localizations.localeOf(context).languageCode;
    if (currentLocale != newLocale) {
      currentLocale = newLocale;
      _updateDropDownMenuEntryList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(s.startStation),
        const Gap(10),
        BlocListener<TripCubit, TripState>(
          listener: (context, state) {
            if (state is PositionSuccessState) {
              startStationsOnSelectedFunction(context: context)(
                state.nearestStation.name,
              );
            }
          },
          child: AppDropdownMenu(
            controller: TripCubit.get(context).startStationController,
            hintText: s.startStation,
            dropdownMenuEntry: startStationList,
            onSelected: startStationsOnSelectedFunction(context: context),
          ),
        ),
        const Gap(10),
        Text(s.finalStation),
        const Gap(10),
        AppDropdownMenu(
          controller: TripCubit.get(context).finalStationController,
          hintText: s.finalStation,
          dropdownMenuEntry: finalStationList,
          onSelected: finalStationsOnSelectedFunction(context: context),
        ),
        const Gap(30),
        AppButton(
          onPressed: () async {
            TripDetailsModel? details;
            try {
              details = TripCubit.get(
                context,
              ).getTripDetails(startStation, lastStation);
              // await  Navigator.pushNamed(
              //     context,
              //     AppRoutes.detailsView,
              //     arguments: details,
              //   );
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
      ],
    );
  }

  void _updateDropDownMenuEntryList() {
    startStationList.clear();
    finalStationList.clear();
    TripCubit.get(context).startStationController.clear();
    TripCubit.get(context).finalStationController.clear();
    if (isArabic(context)) {
      String localStation;
      for (var station in allStations) {
        localStation = stationName(station)!;

        startStationList.add(
          DropdownMenuEntry(value: station, label: localStation),
        );
        finalStationList.add(
          DropdownMenuEntry(value: station, label: localStation),
        );
      }
    } else {
      for (var station in allStations) {
        startStationList.add(DropdownMenuEntry(value: station, label: station));
        finalStationList.add(DropdownMenuEntry(value: station, label: station));
      }
    }
  }

  Function(dynamic) startStationsOnSelectedFunction({
    required BuildContext context,
  }) {
    return (value) {
      print(value);
      startStation = value;
      context.read<TripCubit>().startStationController.text = stationName(
        value,
      )!;

      if (lastStartStationName != null &&
          lastFinalStationIndex != null &&
          !finalStationList.any((e) => e.value == lastStartStationName)) {
        finalStationList.insert(
          lastStartStationIndex!,
          DropdownMenuEntry(
            value: lastStartStationName!,
            label: stationName(lastStartStationName!)!,
          ),
        );
      }

      lastStartStationName = value;
      lastStartStationIndex = finalStationList.indexWhere(
        (e) => e.value == value,
      );

      finalStationList.removeWhere((e) => e.value == value);
      FocusScope.of(context).unfocus();
      setState(() {});
    };
  }

  Function(dynamic) finalStationsOnSelectedFunction({
    required BuildContext context,
  }) {
    return (value) {
      lastStation = value;
      context.read<TripCubit>().finalStationController.text = stationName(
        value,
      )!;

      if (lastFinalStationName != null &&
          lastFinalStationIndex != null &&
          !startStationList.any((e) => e.value == lastFinalStationName)) {
        startStationList.insert(
          lastFinalStationIndex!,
          DropdownMenuEntry(
            value: lastFinalStationName!,
            label: stationName(lastFinalStationName!)!,
          ),
        );
      }

      lastFinalStationName = value;
      lastFinalStationIndex = startStationList.indexWhere(
        (e) => e.value == value,
      );

      startStationList.removeWhere((e) => e.value == value);

      FocusScope.of(context).unfocus();

      setState(() {});
    };
  }
}
