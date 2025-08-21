import 'package:flutter/material.dart';
import 'package:metro_egypt_guide/core/utilities/app_color.dart';

abstract class AppTheme {
  // <=========================Light Theme==============================>

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,

    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColor.primaryColor,
      onPrimary: Colors.white,
      secondary: Colors.blueAccent,
      onSecondary: Colors.blueAccent,
      error: Colors.red,
      onError: Colors.white,
      surface: AppColor.primaryColor,
      onSurface: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: TextStyle()
      ),
    ),
  );

  // <=========================Dark Theme==============================>
  static final ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
}
