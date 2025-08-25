import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key, required this.icon});
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xffE9D4D5),
      radius: 22,
      child: IconButton(
        onPressed: () {

        },
        icon: icon,
      ),
    );
  }
}
