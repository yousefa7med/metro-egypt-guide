import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_metro/core/config/configrations.dart';
import 'package:go_metro/core/navigations/navigations.dart';
import 'package:go_metro/core/utilities/app_color.dart';
import 'package:go_metro/core/widgets/app_card.dart';
import 'package:go_metro/features/home/controller/trip_cubit/trip_cubit.dart';
import 'package:go_metro/features/home/presentation/widgets/fav_station_row.dart';

class FavTripRow extends StatelessWidget {
  const FavTripRow({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final trips = context.read<TripCubit>().trips;

    return InkWell(
      onTap: () {
        AppNavigation.pushName(
          context: context,
          route: AppRoutes.detailsView,
          argument: trips[index],
          rootNavigator: true,
        );
      },
      child: AppCard(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // IconButton(onPressed: (){}, icon: icon)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FavStationRow(
                    color: trips[index].startColor,
                    station: trips[index].startStation!,
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: AppColor.primaryColor,
                    size: 28,
                  ),
                  FavStationRow(
                    color: trips[index].finalColor,
                    station: trips[index].finalStation!,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
