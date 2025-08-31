import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metro_egypt_guide/core/Helper/functions/functions.dart';
import 'package:metro_egypt_guide/core/config/configrations.dart';
import 'package:metro_egypt_guide/core/utilities/app_color.dart';
import 'package:metro_egypt_guide/features/home/controller/trip_cubit/trip_cubit.dart';
import 'package:metro_egypt_guide/features/home/presentation/views/home_view.dart';
import 'package:metro_egypt_guide/features/lines/presentation/views/lines_view.dart';
import 'package:metro_egypt_guide/features/settings/presentation/views/settings_view.dart';
import 'package:metro_egypt_guide/generated/l10n.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late PersistentTabController _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      
      navBarStyle: NavBarStyle.style6,
      controller: _controller,
      context,
      screens: _screenList(),
      items:  _navBarsItems(context),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
    );
  }
}

List<Widget> _screenList() => [
  BlocProvider(create: (context) => TripCubit(), child: const HomeView()),
  const LinesView(),
  const SettingsView(),
];

List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) => [
  PersistentBottomNavBarItem(
    
    icon: const Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Icon(Icons.home),
    ),
    title: (S.of(context).Home),
    activeColorPrimary: AppColor.primaryColor,
    inactiveColorPrimary: Colors.grey,

    routeAndNavigatorSettings: RouteAndNavigatorSettings(
      initialRoute: AppRoutes.homeView,
      routes: {
       AppRoutes.settingsView: (final context) => const SettingsView(),
        AppRoutes.linesView: (final context) => const LinesView(),
      },
    ),
  ),
  PersistentBottomNavBarItem(
    icon: const Icon(Icons.route),
    title: (S.of(context).Lines),
    activeColorPrimary: AppColor.primaryColor,
    inactiveColorPrimary: Colors.grey,
    routeAndNavigatorSettings: RouteAndNavigatorSettings(
      initialRoute: AppRoutes.linesView,
      routes: {
       AppRoutes.homeView: (final context) => const HomeView(),

       AppRoutes.settingsView: (final context) => const SettingsView(),
      },
    ),
  ),
  PersistentBottomNavBarItem(
    icon: const Icon(Icons.settings),
    title: (S.of(context).Settings),
    activeColorPrimary: AppColor.primaryColor,
    inactiveColorPrimary: Colors.grey,
    routeAndNavigatorSettings: RouteAndNavigatorSettings(
      initialRoute:AppRoutes.settingsView,
      routes: {
     AppRoutes.settingsView: (final context) => const SettingsView(),
        AppRoutes.linesView: (final context) => const LinesView(),
      },
    ),
  ),
];
