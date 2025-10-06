import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      height: 80.h,
      width: 90.w,
      decoration: BoxDecoration(
        color: color.withAlpha(29),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon, color: color, size: 28),
          Text(data, style: AppTextStyle.semiBold14.copyWith(color: color)),
        ],
      ),
    );
  }
}
