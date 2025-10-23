import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_metro/core/utilities/app_color.dart';
import 'package:go_metro/core/utilities/app_font_family.dart';
import 'package:go_metro/core/utilities/app_text_style.dart';
import 'package:go_metro/core/widgets/align_text.dart';
import 'package:go_metro/core/widgets/app_card.dart';
import 'package:go_metro/features/details/presentation/widgets/info_container.dart';
import 'package:go_metro/generated/l10n.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({
    super.key,
    required this.time,
    required this.price,
    required this.transfer,
    required this.stationCount,
  });
  final int time;
  final int price;
  final int transfer;
  final int stationCount;
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return AppCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AlignText(
              child: Text(
             s.tripInfo,
                style: AppTextStyle.semiBold16.copyWith(
                  fontFamily: AppFontFamily.inter,
                ),
              ),
            ),
            const Gap(10),
            GridView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 25,
                crossAxisSpacing: 25,
                childAspectRatio: (4.6 / 4).r,
              ),
              children: [
                InfoContainer(
                  color: AppColor.line2Color,
                  icon: Icons.schedule,
                  data: "$time ${s.min}",
                ),
                InfoContainer(
                  color: AppColor.line3Color,
                  icon: Icons.payments,
                  data: "$price ${s.EGY}",
                ),
                InfoContainer(
                  color: AppColor.line1Color,
                  icon: Icons.call_split,
                  data: "$transfer ${s.Transfer}",
                ),

                InfoContainer(
                  color: AppColor.line2Color,
                  icon: Icons.train,
                  data: "$stationCount ${s.station}",
                ),
              ],
            ),

            // Row(

            // ),
          ],
        ),
      ),
    );
  }
}
