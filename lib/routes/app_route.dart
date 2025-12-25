import 'package:flutter/material.dart';
import 'package:goalnow_app/screen/auth/sign_in_form.dart';
import 'package:goalnow_app/screen/auth/sign_up_form.dart';
import 'package:goalnow_app/screen/bottom_tab/bottom_tab.dart';
import 'package:goalnow_app/screen/favourites/favourites_screen.dart';
import 'package:goalnow_app/screen/highlight/hightlight_screen.dart';
import 'package:goalnow_app/screen/home/home_screen.dart';
import 'package:goalnow_app/screen/match/matchs_screen.dart';
import 'package:goalnow_app/screen/news/news_screen.dart';
import 'package:goalnow_app/screen/profile/change_password_screen.dart';
import 'package:goalnow_app/screen/profile/edit_email_screen.dart';
import 'package:goalnow_app/screen/profile/edit_name_screen.dart';
import 'package:goalnow_app/screen/profile/profile_screen.dart';
import 'package:goalnow_app/screen/setting/setting_screen.dart';
import 'package:goalnow_app/screen/transfer/transfer_screen.dart';

class AppRoute {
  // Main Screens
  static const String home = '/home';
  static const String settings = '/settings';
  static const String favorite = '/favorites';
  static const String news = '/news';
  static const String highlight = '/highlight';
  static const String bottomTab = '/bottom_tab';

  static const String signIn = '/sign_in';
  static const String signUp = '/sign_up';
  static const String auth = '/auth';

  static const String profile = '/profile';
  static const String editName = '/edit-name';
  static const String editEmail = '/edit-email';
  static const String changePass = '/change-password';

  static const String matchs = '/matchs';
  static const String matchDetail = '/match-detail';

  static const String transfers = '/transfers';
  static const String standings = '/standings';
  static const String player = '/player';
  static const String leagues = '/leagues';
  static const String friends = '/friends';

  // Add more routes as needed
  Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
    AppRoute.home: (context) => const HomeScreen(),
    AppRoute.settings: (context) => const SettingScreen(),
    AppRoute.favorite: (context) => const FavoritesScreen(),
    AppRoute.news: (context) => const NewsScreen(),
    AppRoute.highlight: (context) => const HighlightScreen(),
    AppRoute.bottomTab: (context) => const BottomTab(),

    AppRoute.signIn: (context) => const SignInScreen(),
    AppRoute.signUp: (context) => const SignUpScreen(),
    AppRoute.profile: (context) => const ProfileScreen(),
    AppRoute.editName: (context) => const EditNameScreen(),
    AppRoute.editEmail: (context) => const EditEmailScreen(),
    AppRoute.changePass: (context) => const ChangePasswordScreen(),

    AppRoute.matchs: (context) => const MatchsScreen(),

    AppRoute.transfers: (context) => const TransferScreen(),
  };
}
