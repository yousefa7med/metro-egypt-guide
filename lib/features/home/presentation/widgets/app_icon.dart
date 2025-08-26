import 'package:flutter/material.dart';


class AppIcon extends StatelessWidget {
  const AppIcon({super.key, required this.icon,required this.onPressed});
  final Widget icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xffE9D4D5),
      radius: 22,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
