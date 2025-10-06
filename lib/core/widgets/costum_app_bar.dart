import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_metro/core/utilities/assets.dart';

class CostumAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CostumAppBar({super.key, required this.title, this.backArrow = false});
  final Widget title;
  final bool backArrow;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.imagesMetrologo, scale: 6),
            const Gap(10),
            title,
            backArrow ? const Gap(60) : const SizedBox(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
