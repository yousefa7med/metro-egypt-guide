import 'package:flutter/material.dart';
import 'package:go_metro/core/config/configrations.dart';
import 'package:go_metro/core/navigations/navigations.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1, milliseconds: 5),
    );
    _animation = Tween<double>(
      begin: 1,
      end: 1.5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));
    _controller.forward();
    Future.delayed(const Duration(seconds: 2), () {
      AppNavigation.pushWithReplacement(
        context: context,
        route: AppRoutes.mainView,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Image.asset('assets/Icon/ic_launcher.png'),
        ),
      ),
    );
  }
}
