import 'package:flutter/material.dart';
import 'package:metro_egypt_guide/core/config/configrations.dart';
import 'package:metro_egypt_guide/core/navigations/navigations.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
   () => AppNavigation.pushWithReplacement(
        context: context,
        route: AppRoutes.mainView,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
