import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metro_egypt_guide/core/Helper/functions/functions.dart';
import 'package:metro_egypt_guide/core/utilities/app_color.dart';
import 'package:metro_egypt_guide/features/home/controller/trip_cubit/trip_cubit.dart';
import 'package:metro_egypt_guide/features/home/presentation/views/home_view.dart';
import 'package:metro_egypt_guide/features/lines/presentation/views/lines_view.dart';
import 'package:metro_egypt_guide/features/settings/presentation/views/settings_view.dart';
import 'package:metro_egypt_guide/generated/l10n.dart';
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
          // color: Theme.of(context).colorScheme.surface,
        ),
      ),

      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
    );
  }
}

List<PersistentTabConfig> _tabs(BuildContext context) => [
  PersistentTabConfig(
    screen: BlocProvider(
      create: (context) => TripCubit(),
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
