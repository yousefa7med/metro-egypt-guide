import 'package:flutter/material.dart';


class AppIcon extends StatelessWidget {
  const AppIcon({super.key, required this.icon, required this.backgroundColorIcon});
  final Widget icon;
    final Color  backgroundColorIcon;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:backgroundColorIcon ,
      radius: 22,
      child: icon,
    );
  }
}
