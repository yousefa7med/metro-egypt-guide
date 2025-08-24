import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:metro_egypt_guide/core/utilities/app_color.dart';
import 'package:metro_egypt_guide/core/utilities/assets.dart';
import 'package:metro_egypt_guide/core/widgets/costum_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CostumAppBar(title: Text('Metro Guide')),

      body: const Center(child: Text('home ')),
    );
  }
}

