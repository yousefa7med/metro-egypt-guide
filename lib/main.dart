import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metro_egypt_guide/core/Helper/cashe_helper/cashe_helper.dart';
import 'package:metro_egypt_guide/core/controllers/localization_cubit/localization_cubit.dart';
import 'package:metro_egypt_guide/core/controllers/theme_cubit/theme_cubit.dart';
import 'package:metro_egypt_guide/core/utilities/app_theme.dart';
import 'package:metro_egypt_guide/features/home/views/home_view.dart';
import 'package:metro_egypt_guide/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CasheHelper().init();
  runApp(const MetroGuide());
}

class MetroGuide extends StatelessWidget {
  const MetroGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocalizationCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],

      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return BlocBuilder<LocalizationCubit, LocalizationState>(
            builder: (context, state) {
              return MaterialApp(
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: ThemeCubit.get(context).getTheme(),
                locale: Locale(LocalizationCubit.get(context).getLang()),
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,

                home: const HomeView(),
              );
            },
          );
        },
      ),
    );
  }
}
