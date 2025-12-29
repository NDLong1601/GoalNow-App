import 'package:flutter/material.dart';
import 'package:goalnow_app/core/const/app_asset_path.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/screen/favourites/favourites_screen.dart';
import 'package:goalnow_app/screen/highlight/highlight_screen.dart';
import 'package:goalnow_app/screen/home/home_screen.dart';
import 'package:goalnow_app/screen/match/match_screen.dart';
import 'package:goalnow_app/screen/news/news_screen.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({super.key});

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  int currentIndex = 0;

  Color _iconColor(int index) {
    return currentIndex == index ? AppColor.primary : AppColor.white;
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

  bool _shown = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_shown) return;

    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (args != null && args['showSuccess'] == true) {
      _shown = true;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(args['message'] ?? 'Success'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryGlow,
      body: IndexedStack(
        index: currentIndex,
        children: const [
          HomeScreen(),
          MatchsScreen(),
          NewsScreen(),
          HighlightScreen(),
          FavoritesScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: AppColor.primary,
        unselectedItemColor: AppColor.white,
        showUnselectedLabels: true,

        items: [
          _buildItem(index: 0, iconPath: AppAssetsPath.home, label: 'Home'),
          _buildItem(index: 1, iconPath: AppAssetsPath.ball, label: 'Matches'),
          _buildItem(index: 2, iconPath: AppAssetsPath.news, label: 'News'),
          _buildItem(
            index: 3,
            iconPath: AppAssetsPath.video,
            label: 'Highlights',
          ),
          _buildItem(
            index: 4,
            iconPath: AppAssetsPath.favourites,
            label: 'Favorites',
          ),
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
