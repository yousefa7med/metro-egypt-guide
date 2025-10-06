import 'package:flutter/material.dart';
import 'package:go_metro/core/Helper/functions/functions.dart';

class AlignText extends StatelessWidget {
  const AlignText({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isArabic() ? Alignment.centerRight : Alignment.centerLeft,

      child: child,
    );
  }
}
