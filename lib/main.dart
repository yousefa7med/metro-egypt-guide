import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_metro/core/Helper/cashe_helper/cashe_helper.dart';
import 'package:go_metro/core/config/configrations.dart';
import 'package:go_metro/core/controllers/app_cubit/app_cubit.dart';
import 'package:go_metro/core/utilities/app_theme.dart';

import 'package:go_metro/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CasheHelper().init();

  runApp(
    BlocProvider(
      create: (context) => AppCubit()..init(),
      child: const MetroGuide(),
    ),
  );
}

class MetroGuide extends StatelessWidget {
  const MetroGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return MaterialApp(
              onGenerateRoute: AppRouter.generateRoute,
              themeAnimationCurve: Curves.easeInOut,
              themeAnimationDuration: const Duration(milliseconds: 100),
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: AppCubit.get(context).getTheme(),

              locale: Locale(AppCubit.get(context).getLang()),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,

              initialRoute: AppRoutes.splashView,
            );
          },
        );
      },
    );
  }
}
