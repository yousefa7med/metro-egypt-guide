
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metro_egypt_guide/core/utilities/app_color.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.onPressed, required this.child});
  final void Function() onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 35.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12),
          ),
          foregroundColor: Colors.white,
        ),

        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
