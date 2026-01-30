import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gap/gap.dart';
import 'package:go_metro/core/Helper/functions/functions.dart';
import 'package:go_metro/core/Helper/metro_helper/models/line_model.dart';
import 'package:go_metro/core/utilities/app_color.dart';
import 'package:go_metro/core/utilities/app_font_family.dart';
import 'package:go_metro/core/utilities/app_text_style.dart';
import 'package:go_metro/core/widgets/app_card.dart';
import 'package:go_metro/core/widgets/app_time_line_tile.dart';

import 'package:go_metro/generated/l10n.dart';

class LineViewer extends StatefulWidget {
  const LineViewer({super.key});
  @override
  State<LineViewer> createState() => _LineViewerState();
}

class _LineViewerState extends State<LineViewer> {
  bool isExpanded1 = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  final GlobalKey _key1 = GlobalKey();
  final GlobalKey _key2 = GlobalKey();
  final GlobalKey _key3 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        _buildExpansionTileLine1(),
        _buildExpansionTileLine2(),

        _buildExpansionTileLine3(),
      ],
    );
  }

  SliverMainAxisGroup _buildExpansionTileLine1() {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: GestureDetector(
            onTap: () {
              print('clicked');

              if (!isExpanded1) {
                isExpanded2 = false;
                isExpanded3 = false;
              }
              setState(() {
                isExpanded1 = !isExpanded1;
              });
              if (isExpanded1) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Scrollable.ensureVisible(
                    _key1.currentContext!,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                });
              }
            },
            child: AppCard(
              key: _key1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(radius: 8, backgroundColor: line1.lineColor),
                    const Gap(10),
                    Text(
                      S.of(context).Line1,
                      style: AppTextStyle.medium16.copyWith(
                        fontFamily: AppFontFamily.inter,
                      ),
                    ),
                    const Spacer(),
                    AnimatedRotation(
                      turns: isExpanded1 ? -0.5 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: const Icon(Icons.arrow_upward),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverAnimatedOpacity(
          opacity: isExpanded1 ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 650),
          sliver: isExpanded1
              ? SliverPadding(
                  padding: isArabic()
                      ? const EdgeInsets.only(left: 16, right: 36)
                      : const EdgeInsets.only(right: 16, left: 36),
                  sliver: SliverList.builder(
                    itemCount: line1.stations.length,
                    itemBuilder: (ctx, index) {
                      log(line1.stations[index].name!);
                      return AppTimeLineTile(
                        index: index,
                        stations: line1.stations,
                        color: AppColor.line1Color,
                      );
                    },
                  ),
                )
              : const SliverToBoxAdapter(child: SizedBox.shrink()),
        ),
      ],
    );
  }

  SliverMainAxisGroup _buildExpansionTileLine2() {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: GestureDetector(
            onTap: () {
              print('clicked');

              if (!isExpanded2) {
                isExpanded1 = false;
                isExpanded3 = false;
              }
              setState(() {
                isExpanded2 = !isExpanded2;
              });
              if (isExpanded2) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Scrollable.ensureVisible(
                    _key2.currentContext!,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    alignment: 0.1,
                  );
                });
              }
            },
            child: AppCard(
              key: _key2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 8,
                      backgroundColor: AppColor.line2Color,
                    ),
                    const Gap(10),
                    Text(
                      S.of(context).Line2,
                      style: AppTextStyle.medium16.copyWith(
                        fontFamily: AppFontFamily.inter,
                      ),
                    ),
                    const Spacer(),
                    AnimatedRotation(
                      turns: isExpanded2 ? -0.5 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: const Icon(Icons.arrow_upward),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverAnimatedOpacity(
          opacity: isExpanded2 ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 650),
          sliver: isExpanded2
              ? SliverPadding(
                  padding: isArabic()
                      ? const EdgeInsets.only(left: 16, right: 36)
                      : const EdgeInsets.only(right: 16, left: 36),
                  sliver: SliverList.builder(
                    itemCount: line2.stations.length,
                    itemBuilder: (ctx, index) {
                      log(line2.stations[index].name!);
                      return AppTimeLineTile(
                        index: index,
                        stations: line2.stations,
                        color: AppColor.line2Color,
                      );
                    },
                  ),
                )
              : const SliverToBoxAdapter(child: SizedBox.shrink()),
        ),
      ],
    );
  }

  SliverMainAxisGroup _buildExpansionTileLine3() {
    final line3 = [
      ...line3Main.stations,
      ...line3Branch1.stations,
      ...line3Branch2.stations,
    ];
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: GestureDetector(
            onTap: () {
              print('clicked');

              if (!isExpanded3) {
                isExpanded2 = false;
                isExpanded1 = false;
              }
              setState(() {
                isExpanded3 = !isExpanded3;
              });
              if (isExpanded3) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Scrollable.ensureVisible(
                    _key2.currentContext!,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                });
              }
            },
            child: AppCard(
              key: _key3,

              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 8,
                      backgroundColor: AppColor.line3Color,
                    ),
                    const Gap(10),
                    Text(
                      S.of(context).Line3,
                      style: AppTextStyle.medium16.copyWith(
                        fontFamily: AppFontFamily.inter,
                      ),
                    ),
                    const Spacer(),
                    AnimatedRotation(
                      turns: isExpanded3 ? -0.5 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: const Icon(Icons.arrow_upward),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverAnimatedOpacity(
          opacity: isExpanded3 ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 650),
          sliver: isExpanded3
              ? SliverPadding(
                  padding: isArabic()
                      ? const EdgeInsets.only(left: 16, right: 36)
                      : const EdgeInsets.only(right: 16, left: 36),
                  sliver: SliverList.builder(
                    itemCount: line3.length,
                    itemBuilder: (ctx, index) {
                      log(line3[index].name!);

                      return AppTimeLineTile(
                        index: index,
                        stations: line3,
                        color: AppColor.line3Color,
                      );
                    },
                  ),
                )
              : const SliverToBoxAdapter(child: SizedBox.shrink()),
        ),
      ],
    );
  }
}
