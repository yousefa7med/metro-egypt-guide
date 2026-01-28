import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_metro/core/Helper/functions/functions.dart';
import 'package:go_metro/core/Helper/metro_helper/metro_helper.dart';
import 'package:go_metro/core/config/configrations.dart';
import 'package:go_metro/core/controllers/app_cubit/app_cubit.dart';
import 'package:go_metro/core/utilities/app_color.dart';
import 'package:go_metro/features/details/presentation/views/details_view.dart';
import 'package:go_metro/features/home/controller/trip_cubit/trip_cubit.dart';
import 'package:go_metro/features/home/presentation/views/home_view.dart';
import 'package:go_metro/features/lines/presentation/views/lines_view.dart';
import 'package:go_metro/features/settings/presentation/views/settings_view.dart';
import 'package:go_metro/generated/l10n.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: _tabs(context),
      navBarBuilder: (navBarConfig) => Style6BottomNavBar(
        navBarConfig: navBarConfig,
        height: 58,
        navBarDecoration: NavBarDecoration(
          color: isDark(context) ? AppColor.darkSurface : Colors.white,
        ),
      ),
      onTabChanged: (value) {
        if (value == 1) {
          AppCubit.get(context).lineController1.collapse();
          AppCubit.get(context).lineController2.collapse();
          AppCubit.get(context).lineController3.collapse();
        }
      },
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
    );
  }
}

List<PersistentTabConfig> _tabs(BuildContext context) => [
  PersistentTabConfig(

    navigatorConfig: NavigatorConfig(
      onGenerateRoute: (settings) {
        if (settings.name == AppRoutes.detailsView) {
          return MaterialPageRoute(
            builder: (context) => const DetailsView(),
            settings: settings, // علشان الـ arguments توصل
          );
        }
        return null;
      },
    ),
    // navigatorConfig: NavigatorConfig(
    //   routes: {AppRoutes.detailsView: (context) => const DetailsView()},
    // ),
    screen: BlocProvider(
      create: (context) => TripCubit(metro: Metro()),
      child: const HomeView(),
    ),
    item: ItemConfig(
      icon: const Icon(Icons.home),
      title: S.current.Home,
      activeForegroundColor: AppColor.primaryColor,
      inactiveForegroundColor: isDark(context) ? Colors.white70 : Colors.grey,
    ),
  ),
  PersistentTabConfig(
    screen: const LinesView(),
    item: ItemConfig(
      icon: const Icon(Icons.route),
      title: S.current.Lines,
      activeForegroundColor: AppColor.primaryColor,
      inactiveForegroundColor: isDark(context) ? Colors.white70 : Colors.grey,
    ),
  ),
  PersistentTabConfig(
    screen: const SettingsView(),
    item: ItemConfig(
      icon: const Icon(Icons.settings),
      title: S.current.Settings,
      activeForegroundColor: AppColor.primaryColor,
      inactiveForegroundColor: isDark(context) ? Colors.white70 : Colors.grey,
    ),
  ),
];



