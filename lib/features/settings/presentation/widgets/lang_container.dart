import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:metro_egypt_guide/core/utilities/app_text_style.dart';

class LangContainer extends StatelessWidget {
  const LangContainer({
    super.key,

    this.onTap,
    required this.langCode,
    required this.langName,
  });
  final String langCode;
  final String langName;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45.h,
        width: 300.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey),
        ),
     

        child: Center(
          child: Row(
            children: [
              const Gap(15),
              Text(langCode, style: AppTextStyle.bold18),
              const Gap(15),

              Text(langName, style: AppTextStyle.semiBold16),
            ],
          ),
        ),
      ),
    );
  }
}
