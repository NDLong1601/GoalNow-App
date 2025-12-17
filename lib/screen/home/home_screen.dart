import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_section.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_asset_path.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/core/enum/enum.dart';
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
            onPressed: () =>
                showSideCategoryPanel(context, side: PanelSide.left),
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
              AppSectionHeader(title: 'Favourite Clubs', showAction: false),
            ],
          ),
        ),
      ),
    );
  }

  void showSideCategoryPanel(BuildContext context, {required PanelSide side}) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'SidePanel',
      barrierColor: Colors.black38,
      transitionDuration: const Duration(milliseconds: 280),
      pageBuilder: (_, _, _) => const SizedBox.shrink(),
      transitionBuilder: (context, animation, _, _) {
        final isRight = side == PanelSide.right;

        final slideAnimation =
            Tween<Offset>(
              begin: isRight ? const Offset(1, 0) : const Offset(-1, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            );

        return SlideTransition(
          position: slideAnimation,
          child: Align(
            alignment: isRight ? Alignment.centerRight : Alignment.centerLeft,
            child: SideMenuContent(
              width: MediaQuery.of(context).size.width * 0.7,
              side: side,
            ),
          ),
        );
      },
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;

  const MenuItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: AppText(
        text: title.toUpperCase(),
        style: AppTextStyle.boldTs14White.copyWith(letterSpacing: 0.5),
      ),
    );
  }
}

class SideMenuContent extends StatelessWidget {
  final double width;
  final PanelSide side;

  const SideMenuContent({super.key, required this.width, required this.side});

  @override
  Widget build(BuildContext context) {
    final isRight = side == PanelSide.right;

    return Material(
      color: Colors.transparent,
      child: Container(
        width: width,
        height: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
        color: AppColor.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: isRight ? Alignment.topRight : Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            const SizedBox(height: 24),

            MenuItem(title: 'Tranfers'),
            MenuItem(title: 'Standings'),
            MenuItem(title: 'Player'),
            MenuItem(title: 'Leagues'),
            MenuItem(title: 'Friends'),
          ],
        ),
      ),
    );
  }
}
