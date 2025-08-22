
import 'package:flutter/material.dart';

RouteTransitionsBuilder slideTransitionBuilder =
    (context, animation, secondaryAnimation, child) {
  var begin = const Offset(1.0, 0.0); 
  var end = Offset.zero;
  var curve = Curves.easeInOut; // تأثير الحركة الناعمة
  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  return SlideTransition(position: animation.drive(tween), child: child);
};