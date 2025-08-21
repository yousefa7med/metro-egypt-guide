import 'package:flutter/material.dart';
import 'package:metro_egypt_guide/features/home/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: const HomeView()
    );
  }
}

