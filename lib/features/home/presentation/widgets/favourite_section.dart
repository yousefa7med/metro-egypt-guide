import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_metro/core/Helper/functions/functions.dart';
import 'package:go_metro/core/utilities/app_color.dart';
import 'package:go_metro/core/utilities/app_font_family.dart';
import 'package:go_metro/core/utilities/app_text_style.dart';
import 'package:go_metro/core/widgets/app_card.dart';
import 'package:go_metro/features/home/controller/trip_cubit/trip_cubit.dart';

import 'package:go_metro/features/home/presentation/widgets/fav_trip_row.dart';
import 'package:go_metro/generated/l10n.dart';

class FavouriteSection extends StatefulWidget {
  const FavouriteSection({super.key});

  @override
  State<FavouriteSection> createState() => _FavouriteSectionState();
}

class _FavouriteSectionState extends State<FavouriteSection> {
  final GlobalKey cardKey = GlobalKey();
  bool allFav = false;
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: AppCard(
            key: cardKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    s.favTrips,
                    style: AppTextStyle.semiBold16.copyWith(
                      fontFamily: AppFontFamily.inter,
                    ),
                  ),
                  BlocBuilder<TripCubit, TripState>(
                    builder: (context, state) {
                      if (state is AllFavChangesState) {
                        return (context
                                    .read<TripCubit>()
                                    .favourites
                                    .isNotEmpty &&
                                context.read<TripCubit>().favourites.length > 2)
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    allFav = !allFav;
                                  });
                                  WidgetsBinding.instance.addPostFrameCallback((
                                    _,
                                  ) {
                                    Scrollable.ensureVisible(
                                      cardKey.currentContext!,
                                      duration: const Duration(
                                        milliseconds: 400,
                                      ),
                                      curve: Curves.easeInOut,
                                    );
                                  });
                                },
                                child: !allFav
                                    ? Text(
                                        s.seeMore,
                                        style: AppTextStyle.semiBold14.copyWith(
                                          color: AppColor.primaryColor,
                                        ),
                                      )
                                    : Text(
                                        s.seeLess,
                                        style: AppTextStyle.semiBold14.copyWith(
                                          color: AppColor.primaryColor,
                                        ),
                                      ),
                              )
                            : const SizedBox.shrink();
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),

        BlocBuilder<TripCubit, TripState>(
          buildWhen: (previous, curr) => curr is AllFavChangesState,
          builder: (context, state) {
            if (state is AllFavChangesState &&
                context.read<TripCubit>().favourites.isNotEmpty) {
              final trips = context.read<TripCubit>().favourites;

              return SliverList.builder(
                itemCount: allFav
                    ? trips.length
                    : (trips.length < 2)
                    ? trips.length
                    : 2,
                itemBuilder: (context, index) {
                
                  return Padding(
                    padding: isArabic(context)
                        ? const EdgeInsets.only(left: 10, right: 10)
                        : const EdgeInsets.only(right: 10, left: 10),
                    child: FavTripRow(trip: trips[index]),
                  );
                },
              );
            } else {
              return SliverToBoxAdapter(
                child: SizedBox(
                  height: 110.h,
                  child: Center(
                    child: Text(
                      s.addTrips,
                      style: AppTextStyle.bold18.copyWith(
                        color: const Color.fromARGB(117, 158, 158, 158),
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
