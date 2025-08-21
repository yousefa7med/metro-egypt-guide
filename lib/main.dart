
import 'package:flutter/material.dart';
import 'package:metro_egypt_guide/features/home/views/home_view.dart';
import 'package:metro_egypt_guide/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() {
  runApp(const MetroGuide());
}

class MetroGuide extends StatelessWidget {
  const MetroGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,

      home: const HomeView(),
    );
  }
}
