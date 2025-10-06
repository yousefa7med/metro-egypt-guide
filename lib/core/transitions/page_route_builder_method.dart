import 'package:flutter/material.dart';
import 'package:go_metro/core/transitions/slide_transation_builder.dart';

PageRouteBuilder<dynamic> pageRouteBuilderMethod({
  required Widget Function(BuildContext, Animation<double>, Animation<double>)
  pageBuilder,
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionDuration: const Duration(milliseconds: 230),
    transitionsBuilder: slideTransitionBuilder,
    pageBuilder: pageBuilder,
  );
}
