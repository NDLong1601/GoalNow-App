import 'package:flutter/material.dart';
import 'package:goalnow_app/core/const/app_asset_path.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/screen/favourites/favourites_screen.dart';
import 'package:goalnow_app/screen/highlight/hightlight_screen.dart';
import 'package:goalnow_app/screen/home/home_screen.dart';
import 'package:goalnow_app/screen/news/news_screen.dart';
import 'package:goalnow_app/screen/setting/setting_screen.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({super.key});

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  int currentIndex = 0;

  Color _iconColor(int index) {
    return currentIndex == index ? AppColor.primary : AppColor.grey;
  }

  BottomNavigationBarItem _buildItem({
    required int index,
    required String iconPath,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        iconPath,
        width: 24,
        height: 24,
        color: _iconColor(index),
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: IndexedStack(
        index: currentIndex,
        children: const [
          HomeScreen(),
          NewsScreen(),
          HighlightScreen(),
          FavoritesScreen(),
          SettingScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: AppColor.primary,
        unselectedItemColor: AppColor.grey,
        showUnselectedLabels: true,

        items: [
          _buildItem(index: 0, iconPath: AppAssetsPath.home, label: 'Home'),
          _buildItem(index: 1, iconPath: AppAssetsPath.news, label: 'News'),
          _buildItem(index: 2, iconPath: AppAssetsPath.video, label: 'HighLight'),
          _buildItem(
            index: 3,
            iconPath: AppAssetsPath.favourites,
            label: 'Favorites',
          ),
          _buildItem(index: 4, iconPath: AppAssetsPath.setting, label: 'Setting'),
        ],

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
