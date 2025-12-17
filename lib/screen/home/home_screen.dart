import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_section.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_asset_path.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/routes/app_route.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.background,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(AppAssetsPath.list),
              color: AppColor.iconPrimary,
              size: 24,
            ),
          ),

          title: AppText(text: "GOAL NOW", style: AppTextStyle.h1),
          actions: [
            IconButton(
              icon: ImageIcon(
                AssetImage(AppAssetsPath.setting),
                color: AppColor.iconPrimary,
                size: 24,
              ),
              onPressed: () => Navigator.pushNamed(context, AppRoute.settings),
            ),
          ],
        ),

        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .center,
            children: [
              AppSectionHeader(
                title: 'Featured Matches',
                showAction: true,
                actionText: 'See More',
                onTap: () => {Navigator.pushNamed(context, AppRoute.news)},
              ),

              AppSectionHeader(
                title: 'Hot News',
                showAction: true,
                actionText: 'See More',
              ),
              AppSectionHeader(
                title: 'Popular Highlights',
                showAction: true,
                actionText: 'See More',
              ),
              AppSectionHeader(title: 'Favourite Clubs'),
            ],
          ),
        ),
      ),
    );
  }
}
