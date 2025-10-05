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
      tabs: _tabs(),
      navBarBuilder: (navBarConfig) => Style7BottomNavBar(
        navBarConfig: navBarConfig,
        height: 58,
        navBarDecoration: NavBarDecoration(
          color: isDark(context) ? AppColor.darkSurface : Colors.white,
        ),
      ),

      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,

      // useRootNavigator: true,
      // hideNavigationBarWhenKeyboardAppears: true,

      // popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
      // animationSettings: const NavBarAnimationSettings(
      //   navBarItemAnimation: ItemAnimationSettings(
      //     duration: Duration(milliseconds: 400),
      //     curve: Curves.ease,
      //   ),
      //   screenTransitionAnimation: ScreenTransitionAnimationSettings(
      //     animateTabTransition: true,
      //     duration: Duration(milliseconds: 400),
      //     screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
      //   ),
      // ),
      //   confineToSafeArea: true,
      //   navBarHeight: kBottomNavigationBarHeight,
    );
  }
}

// List<Widget> _screenList() => [
//   BlocProvider(create: (context) => TripCubit(), child: const HomeView()),
//   const LinesView(),
//   const SettingsView(),
// ];

// List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) => [
//   PersistentBottomNavBarItem(
//     icon: const Padding(
//       padding: EdgeInsets.only(top: 8.0),
//       child: Icon(Icons.home),
//     ),
//     title: (S.of(context).Home),
//     activeColorPrimary: AppColor.primaryColor,
//     inactiveColorPrimary: Colors.grey,
//   ),
//   PersistentBottomNavBarItem(
//     icon: const Icon(Icons.route),
//     title: (S.of(context).Lines),
//     activeColorPrimary: AppColor.primaryColor,
//     inactiveColorPrimary: Colors.grey,
//   ),
//   PersistentBottomNavBarItem(
//     icon: const Icon(Icons.settings),
//     title: (S.of(context).Settings),
//     activeColorPrimary: AppColor.primaryColor,
//     inactiveColorPrimary: Colors.grey,
//   ),
// ];

List<PersistentTabConfig> _tabs() => [
  PersistentTabConfig(
    screen: BlocProvider(
      create: (context) => TripCubit(),
      child: const HomeView(),
    ),
    item: ItemConfig(
      icon: const Icon(Icons.home),
      title: S.current.Home,
      activeForegroundColor: AppColor.primaryColor,
      inactiveForegroundColor: Colors.white70,
    ),
  ),
  PersistentTabConfig(
    screen: const LinesView(),
    item: ItemConfig(
      icon: const Icon(Icons.route),
      title: S.current.Lines,
      activeForegroundColor: AppColor.primaryColor,
      inactiveForegroundColor: Colors.white70,
    ),
  ),
  PersistentTabConfig(
    screen: const SettingsView(),
    item: ItemConfig(
      icon: const Icon(Icons.settings),
      title: S.current.Settings,
      activeForegroundColor: AppColor.primaryColor,
      inactiveForegroundColor: Colors.white70,
    ),
  ),
];
