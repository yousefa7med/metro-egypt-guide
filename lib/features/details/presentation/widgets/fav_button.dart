
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_metro/core/Helper/metro_helper/models/trip_details_model.dart';
import 'package:go_metro/core/utilities/app_color.dart';
import 'package:go_metro/core/utilities/app_font_family.dart';
import 'package:go_metro/core/utilities/app_text_style.dart';
import 'package:go_metro/features/home/controller/trip_cubit/trip_cubit.dart';
import 'package:go_metro/generated/l10n.dart';

class FavButton extends StatefulWidget {
  const FavButton({super.key});

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  bool isFav = false;
  late final TripDetailsModel details;
  late final TripCubit tripCubit;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      details = ModalRoute.of(context)!.settings.arguments as TripDetailsModel;
      tripCubit = context.read<TripCubit>();
      setState(() {
        isFav = details.isFav;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    if (details.isFav != isFav) {
      isFav ? tripCubit.addToFav(details) : tripCubit.removeFromFav(details);
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColor.primaryColor,
          side: const BorderSide(color: AppColor.primaryColor, width: 3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12),
          ),
        ),
        onPressed: () {
          setState(() {
            isFav = !isFav;
          });
        },
        child: SizedBox(
          height: 35.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isFav ? Icons.star_outline : Icons.star,
                color: AppColor.primaryColor,
                size: 26,
              ),
              const Gap(4),
              Text(
                isFav ? s.remfromFav : s.addToFav,
                style: AppTextStyle.medium16.copyWith(
                  fontFamily: AppFontFamily.inter,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
