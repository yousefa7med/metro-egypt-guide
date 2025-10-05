import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

bool isArabic() {
  return Intl.getCurrentLocale() == "ar";
}

bool isDark(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}
