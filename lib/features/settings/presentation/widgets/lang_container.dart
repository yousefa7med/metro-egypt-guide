import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:metro_egypt_guide/core/utilities/app_color.dart';
import 'package:metro_egypt_guide/core/utilities/app_text_style.dart';

class LangContainer extends StatelessWidget {
  const LangContainer({
    super.key,
    this.onTap,
    required this.langCode,
    required this.langName,
    required this.lang,
  });
  final String langCode;
  final String langName;
  final void Function()? onTap;
  final bool lang;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45.h,
        width: 300.w,
        decoration: BoxDecoration(
          color: lang ? AppColor.selectedSetting : null,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: lang ? Colors.blue : Colors.grey),
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
