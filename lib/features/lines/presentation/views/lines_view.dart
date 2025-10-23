import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_metro/core/Helper/metro_helper/models/line_model.dart';
import 'package:go_metro/core/utilities/app_font_family.dart';
import 'package:go_metro/core/utilities/app_text_style.dart';
import 'package:go_metro/core/widgets/app_card.dart';
import 'package:go_metro/core/widgets/costum_app_bar.dart';
import 'package:go_metro/features/lines/presentation/widgets/line_viewer.dart';
import 'package:go_metro/features/lines/presentation/widgets/metro_map_previewer.dart';
import 'package:go_metro/generated/l10n.dart';

class LinesView extends StatelessWidget {
  const LinesView({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      appBar: CostumAppBar(
        title: Text(
        s.Lines,
          style: AppTextStyle.regular20.copyWith(
            color: Colors.white,

            fontFamily: AppFontFamily.inter,
          ),
        ),
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          spacing: 15,
          children: [
            const Gap(5),
            const AppCard(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: MetroMapPreviewer(),
              ),
            ),
            AppCard(
              child: Column(
                children: [
                  LineViewer(line: line1.stations, name: s.Line1),
                  LineViewer(line: line2.stations, name: s.Line2),
                  LineViewer(
                    line: [
                      ...line3Main.stations,
                      ...line3Branch1.stations.where(
                        (e) => e.name != kitKat.name,
                      ),
                      ...line3Branch2.stations.where(
                        (e) => e.name != kitKat.name,
                      ),
                    ],
                    name: s.Line3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
