import 'package:flutter/material.dart';
//import 'package:swipeflix/presentation/homepage_screen/Homepage_takis.dart';
import 'package:swipeflix/presentation/welcoming_page_screen/welcoming_page_screen.dart';
import 'package:swipeflix/presentation/launching_app_screen/launching_app_screen.dart';
import 'package:swipeflix/presentation/homepage_screen/homepage_screen.dart';
//import 'package:swipeflix/presentation/homepage_screen/homepage_takis.dart';
import 'package:swipeflix/presentation/lists_screen/lists_screen.dart';
import 'package:swipeflix/presentation/searchpage_screen/searchpage_screen.dart';
import 'package:swipeflix/presentation/details_screen/details_screen.dart';
import 'package:swipeflix/presentation/settings_screen/settings_screen.dart';
import 'package:swipeflix/presentation/about_this_app_screen/about_this_app_screen.dart';
import 'package:swipeflix/presentation/dark_light_mode_screen/dark_light_mode_screen.dart';
import 'package:swipeflix/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String welcomingPageScreen = '/welcoming_page_screen';

  static const String launchingAppScreen = '/launching_app_screen';

  static const String homepageScreen = '/homepage_screen';

  static const String listsScreen = '/lists_screen';

  static const String searchpageScreen = '/searchpage_screen';

  static const String detailsScreen = '/details_screen';

  static const String settingsScreen = '/settings_screen';

  static const String aboutThisAppScreen = '/about_this_app_screen';

  static const String darkLightModeScreen = '/dark_light_mode_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    welcomingPageScreen: (context) => WelcomingPageScreen(),
    launchingAppScreen: (context) => LaunchingAppScreen(),
    homepageScreen: (context) => Homepage(),
    listsScreen: (context) => ListsScreen(),
    searchpageScreen: (context) => SearchpageScreen(),
    detailsScreen: (context) => DetailsScreen(),
    settingsScreen: (context) => SettingsScreen(),
    aboutThisAppScreen: (context) => AboutThisAppScreen(),
    darkLightModeScreen: (context) => DarkLightModeScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
