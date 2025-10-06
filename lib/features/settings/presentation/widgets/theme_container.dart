import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_metro/core/utilities/app_color.dart';
import 'package:go_metro/core/utilities/app_text_style.dart';

class ThemeContainer extends StatelessWidget {
  const ThemeContainer({
    super.key,
    required this.icon,
    required this.themeType,
    this.onTap,
    required this.isSelected,
  });
  final Widget icon;
  final String themeType;
  final void Function()? onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80.h,
        width: 130.w,
        decoration: BoxDecoration(
          color: isSelected ? AppColor.selectedSetting : null,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? Colors.blue : Colors.grey),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              icon,
              Text(themeType, style: AppTextStyle.medium16),
            ],
          ),
        ),
      ),
    );
  }
}
