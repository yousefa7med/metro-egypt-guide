import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_metro/core/Helper/metro_helper/models/trip_details_model.dart';
import 'package:go_metro/core/Helper/mixins/station_name_mixin.dart';
import 'package:go_metro/core/config/configrations.dart';
import 'package:go_metro/core/navigations/navigations.dart';
import 'package:go_metro/core/utilities/app_color.dart';
import 'package:go_metro/core/widgets/app_card.dart';
import 'package:go_metro/features/home/controller/trip_cubit/trip_cubit.dart';
import 'package:go_metro/features/home/presentation/widgets/fav_station_row.dart';
import 'package:go_metro/generated/l10n.dart';

class FavTripRow extends StatelessWidget with StationNameMixin {
  const FavTripRow({super.key, required this.trip});
  final TripDetailsModel trip;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigation.pushName(
          context: context,
          route: AppRoutes.detailsView,
          argument: trip,
          rootNavigator: true,
        );
      },
      child: AppCard(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  deleteDialog(context: context, trip: trip);
                },
                child: const Icon(
                  Icons.close,
                  color: AppColor.primaryColor,
                  weight: 50,
                  size: 30,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FavStationRow(
                    color: trip.startColor,
                    station: stationName(trip.startStation!)!,
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: AppColor.primaryColor,
                    size: 28,
                  ),
                  FavStationRow(
                    color: trip.finalColor,
                    station: stationName(trip.finalStation!)!,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void deleteDialog({
    required BuildContext context,
    required TripDetailsModel trip,
  }) {
    final s = S.of(context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
        title: Text(s.delTrip),
        content: Text(s.AreYouSure),
        actions: [
          TextButton(
            child: Text(
              s.cancel,
              style: const TextStyle(color: AppColor.primaryColor),
            ),
            onPressed: () {
              Navigator.pop(ctx);
            },
          ),
          TextButton(
            child: Text(
              s.delete,
              style: const TextStyle(color: AppColor.primaryColor),
            ),
            onPressed: () async {
              Navigator.pop(ctx);
              context.read<TripCubit>().removeFromFav(trip);
            },
          ),
        ],
      ),
    );
  }
}
