import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_metro/core/Helper/functions/app_dialog.dart';
import 'package:go_metro/core/Helper/functions/functions.dart';
import 'package:go_metro/core/Helper/functions/show_snackBer.dart';
import 'package:go_metro/core/errors/app_exeption.dart';
import 'package:go_metro/core/utilities/app_color.dart';
import 'package:go_metro/core/utilities/app_font_family.dart';
import 'package:go_metro/core/utilities/app_text_style.dart';
import 'package:go_metro/core/widgets/app_card.dart';
import 'package:go_metro/core/widgets/station_row.dart';
import 'package:go_metro/features/home/controller/trip_cubit/trip_cubit.dart';
import 'package:go_metro/features/home/presentation/widgets/app_icon.dart';
import 'package:go_metro/generated/l10n.dart';

class NearestStationSection extends StatelessWidget {
  const NearestStationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return AppCard(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListTile(
          title: Text(
            s.nearestStation,
            style: AppTextStyle.semiBold18.copyWith(
              fontFamily: AppFontFamily.inter,
            ),
          ),

          subtitle: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: BlocBuilder<TripCubit, TripState>(
              buildWhen: (prev, curr) {
                return curr is PositionSuccessState ||
                    curr is PositionLoadingState;
              },
              builder: (context, state) {
                if (state is PositionLoadingState) {
                  return SizedBox(height: 19.h);
                } else if (state is PositionSuccessState) {
                  return TripCubit.get(context).nearestStation != null
                      ? StationRow(
                          color: TripCubit.get(
                            context,
                          ).nearestStation!.lineColor!,
                          station: TripCubit.get(
                            context,
                          ).nearestStation!.getStationName()!,
                        )
                      : SizedBox(height: 19.h);
                }
                return SizedBox(height: 19.h);
              },
            ),
          ),

          trailing: Padding(
            padding: isArabic()
                ? const EdgeInsets.only(left: 8.0)
                : const EdgeInsets.only(right: 8.0),
            child: BlocBuilder<TripCubit, TripState>(
              buildWhen: (prev, curr) {
                return curr is PositionSuccessState ||
                    curr is PositionLoadingState;
              },
              builder: (context, state) {
                if (state is PositionLoadingState) {
                  return Transform.scale(
                    scale: 0.8,
                    child: const CircularProgressIndicator(strokeWidth: 5),
                  );
                } else {
                  return Transform.scale(
                    scale: 1.23,
                    child: AppIcon(
                      icon: IconButton(
                        icon: const Icon(
                          Icons.location_on,
                          color: AppColor.primaryColor,
                          size: 28,
                        ),
                        onPressed: () async {
                          showSnackBar(context, s.pleaseWait);
                          try {
                            await TripCubit.get(
                              context,
                            ).getNearestStation(userPressed: true);
                          } on TripDetailsException catch (e) {
                            appDialog(context: context, msg: e.message);
                          }
                        },
                      ),
                      backgroundColorIcon: AppColor.primaryColor.withAlpha(29),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
