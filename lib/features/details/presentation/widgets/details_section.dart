import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:metro_egypt_guide/core/utilities/app_color.dart';
import 'package:metro_egypt_guide/core/utilities/app_font_family.dart';
import 'package:metro_egypt_guide/core/utilities/app_text_style.dart';
import 'package:metro_egypt_guide/core/widgets/align_text.dart';
import 'package:metro_egypt_guide/core/widgets/app_card.dart';
import 'package:metro_egypt_guide/features/details/presentation/widgets/info_container.dart';
import 'package:metro_egypt_guide/generated/l10n.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AlignText(
              child: Text(
                S.of(context).tripInfo,
                style: AppTextStyle.semiBold16.copyWith(
                  fontFamily: AppFontFamily.inter,
                ),
              ),
            ),
            const Gap(10),
            Row(
              children: [
                InfoContainer(
                  color: AppColor.line1Color,
                  icon: Icons.schedule,
                  data: "15 ${S.of(context).min}",
                ),
                const Gap(15),
                InfoContainer(
                  color: AppColor.primaryColor,
                  icon: Icons.payments,
                  data: "25 ${S.of(context).EGY}",
                ),
                const Gap(15),
                InfoContainer(
                  color: AppColor.line3Color,
                  icon: Icons.call_split,
                  data: "2 ${S.of(context).Transfer}",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
