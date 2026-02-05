import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_metro/core/Helper/cashe_helper/cache_helper.dart';
import 'package:go_metro/core/Helper/metro_helper/metro_helper.dart';
import 'package:go_metro/core/config/configrations.dart';
import 'package:go_metro/core/controllers/app_cubit/app_cubit.dart';
import 'package:go_metro/core/observer.dart';
import 'package:go_metro/core/utilities/app_theme.dart';
import 'package:go_metro/features/home/controller/trip_cubit/trip_cubit.dart';

import 'package:go_metro/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  await GetIt.instance<ObjectBoxServices>().init();
  await GetIt.instance<CacheHelper>().init();
  Bloc.observer = AppBlocObserver();

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

void configureDependencies() {
  GetIt.instance.registerSingleton<Metro>(Metro());
  GetIt.instance.registerSingleton<CacheHelper>(CacheHelper());
  GetIt.instance.registerSingleton<ObjectBoxServices>(ObjectBoxServices());
  GetIt.instance.registerLazySingleton<TripCubit>(
    () => TripCubit(metro: GetIt.instance<Metro>()),
  );
}
