
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:go_metro/core/utilities/app_font_family.dart';
import 'package:go_metro/core/utilities/app_text_style.dart';
import 'package:go_metro/core/widgets/app_card.dart';
import 'package:go_metro/features/home/presentation/widgets/find_route_form.dart';
import 'package:go_metro/generated/l10n.dart';

class FindRouteSection extends StatelessWidget {
  const FindRouteSection({super.key});
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return AppCard(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              s.FindRoute,
              style: AppTextStyle.semiBold16.copyWith(
                fontFamily: AppFontFamily.inter,
              ),
            ),
            const Gap(10),
            const FindRouteForm(),
            const Gap(5),
          ],
        ),
      ),
    );
  }
}
