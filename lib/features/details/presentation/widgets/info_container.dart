import 'package:flutter/material.dart';
import 'package:go_metro/core/utilities/app_text_style.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({
    super.key,
    required this.color,
    required this.icon,
    required this.data,
  });
  final Color color;
  final IconData icon;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: color.withAlpha(29),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon, color: color, size: 32),
          Text(data, style: AppTextStyle.semiBold16.copyWith(color: color)),
        ],
      ),
    );
  }
}
