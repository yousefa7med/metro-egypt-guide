import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metro_egypt_guide/core/transitions/page_route_builder_method.dart';
import 'package:metro_egypt_guide/features/details/presentation/views/details_view.dart';
import 'package:metro_egypt_guide/features/home/controller/trip_cubit/trip_cubit.dart';
import 'package:metro_egypt_guide/features/home/presentation/views/home_view.dart';
import 'package:metro_egypt_guide/features/lines/presentation/views/lines_view.dart';
import 'package:metro_egypt_guide/features/main/presentation/views/main_view.dart';
import 'package:metro_egypt_guide/features/settings/presentation/views/settings_view.dart';
import 'package:metro_egypt_guide/features/splash_view/splash_view.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeView:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => TripCubit(),
            child: const HomeView(),
          ),
        );
      case AppRoutes.mainView:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MainView(),
        );
      case AppRoutes.settingsView:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SettingsView(),
        );
      case AppRoutes.linesView:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LinesView(),
        );
      case AppRoutes.detailsView:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const DetailsView(),
        );
      case AppRoutes.splashView:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SplashView(),
        );

      default:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const Scaffold(),
        );
    }
  }
}

abstract class AppRoutes {
  static const String mainView = '/';
  static const String homeView = '/homeView';
  static const String linesView = '/linesView';
  static const String settingsView = '/settingsView';
  static const String detailsView = '/DetailsView';
  static const String splashView = '/splashView';
}
