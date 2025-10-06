import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


import 'package:go_metro/core/widgets/app_card.dart';
import 'package:go_metro/features/details/presentation/widgets/station_container.dart';
import 'package:go_metro/generated/l10n.dart';

class StartAndFinalStationSection extends StatelessWidget {
  const StartAndFinalStationSection({
    super.key,
    required this.start,
    required this.end,
    required this.startLine,
    required this.startColor, required this.lastLine, required this.lastColor,
  });
  final String start;
  final String end;
  final String startLine;
  final String lastLine;
  final Color startColor;
  final Color lastColor;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            StationContainer(
              title: S.of(context).from,
              station: start,
              color: startColor,
              line: startLine,
            ),
            const Gap(15),
            StationContainer(
              title: S.of(context).to,
              station: end,
              color: lastColor,
              line: lastLine
            ),
          ],
        ),
      ),
    );
  }
}
