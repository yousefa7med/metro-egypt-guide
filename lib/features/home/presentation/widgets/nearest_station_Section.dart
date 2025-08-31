import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:metro_egypt_guide/core/Helper/functions/functions.dart';
import 'package:metro_egypt_guide/core/Helper/functions/show_snackBer.dart';
import 'package:metro_egypt_guide/core/utilities/app_color.dart';
import 'package:metro_egypt_guide/core/utilities/app_font_family.dart';
import 'package:metro_egypt_guide/core/utilities/app_text_style.dart';
import 'package:metro_egypt_guide/core/widgets/app_card.dart';
import 'package:metro_egypt_guide/features/home/controller/trip_cubit/trip_cubit.dart';
import 'package:metro_egypt_guide/features/home/presentation/widgets/app_icon.dart';
import 'package:metro_egypt_guide/generated/l10n.dart';

class NearestStationSection extends StatelessWidget {
  const NearestStationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListTile(
          title: Text(
            S.of(context).nearestStation,
            style: AppTextStyle.semiBold18.copyWith(
              fontFamily: AppFontFamily.inter,
            ),
          ),

          subtitle: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: BlocBuilder<TripCubit, TripState>(
              builder: (context, state) {
                print(TripCubit.get(context).nearestStation?.name);

                return TripCubit.get(context).nearestStation != null
                    ? Row(
                        children: [
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: TripCubit.get(
                              context,
                            ).nearestStation!.lineColor,
                          ),
                          const Gap(10),
                          Text(
                            TripCubit.get(context).nearestStation!.name!,
                            style: AppTextStyle.medium16.copyWith(
                              fontFamily: AppFontFamily.inter,
                            ),
                          ),
                        ],
                      )
                    : SizedBox(height: 19.h);
              },
            ),
          ),

          trailing: Transform.scale(
            scale: 1.23,
            child: Padding(
              padding: isArabic()
                  ? const EdgeInsets.only(left: 8.0)
                  : const EdgeInsets.only(right: 8.0),
              child: AppIcon(
                icon: IconButton(
                  icon: const Icon(
                    Icons.location_on,
                    color: AppColor.primaryColor,
                    size: 28,
                  ),
                  onPressed: () async {
                    showSnackBar(context, 'Please wait');
                    await TripCubit.get(
                      context,
                    ).getNearestStation(context, userPressed: true);
                  },
                ),
                backgroundColorIcon: AppColor.backgroundLocationIconColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
