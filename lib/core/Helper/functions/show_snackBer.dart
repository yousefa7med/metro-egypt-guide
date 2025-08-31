import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: const Color(0xff323232),
      duration: const Duration(seconds: 1, milliseconds: 500),
      content: Center(
        child: Text(message, style: const TextStyle(color: Colors.white)),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

      margin: const EdgeInsets.only(right: 30, left: 30),
      elevation: 6,
    ),
  );
}
