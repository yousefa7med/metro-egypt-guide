import 'package:flutter/material.dart';

bool isArabic(BuildContext context) {
  return Localizations.localeOf(context).languageCode == "ar";
}

bool isDark(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}
