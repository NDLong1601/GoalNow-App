import 'package:flutter/material.dart';
import 'package:goalnow_app/screen/bottom_tab/bottom_tab.dart';
import 'package:goalnow_app/screen/favourites/favourites_screen.dart';
import 'package:goalnow_app/screen/highlight/hightlight_screen.dart';
import 'package:goalnow_app/screen/home/home_screen.dart';
import 'package:goalnow_app/screen/news/news_screen.dart';
import 'package:goalnow_app/screen/setting/setting_screen.dart';

class AppRoute {
  static const String home = '/home';
  static const String settings = '/settings';
  static const String favorite = '/favorites';
  static const String news = '/news';
  static const String highlight = '/highlight';
  static const String bottomTab = '/bottom_tab';

  Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
    AppRoute.home: (context) => const HomeScreen(),
    AppRoute.settings: (context) => const SettingScreen(),
    AppRoute.favorite: (context) => const FavoritesScreen(),
    AppRoute.news: (context) => const NewsScreen(),
    AppRoute.highlight: (context) => const HighlightScreen(),
    AppRoute.bottomTab: (context) => const BottomTab(),
  };
}