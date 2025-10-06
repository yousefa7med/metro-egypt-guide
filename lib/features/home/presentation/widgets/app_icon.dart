import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
    required this.icon,
    required this.backgroundColorIcon,
    this.radius = 22,
  });
  final Widget icon;
  final Color backgroundColorIcon;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColorIcon,
      radius: radius,
      child: icon,
    );
  }
}
