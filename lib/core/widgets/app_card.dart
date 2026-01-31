import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        child: Card(
          shadowColor: const Color.fromARGB(95, 135, 135, 135),

          child: child,
        ),
      ),
    );
  }
}
