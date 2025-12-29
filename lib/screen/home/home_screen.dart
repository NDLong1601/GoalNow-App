import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_scaffold.dart';
import 'package:goalnow_app/component/app_section.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_asset_path.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/core/enum/enum.dart';
import 'package:goalnow_app/core/extension/context_extension.dart';
import 'package:goalnow_app/routes/app_route.dart';
import 'package:goalnow_app/screen/home/widget/build_featured_match.dart';
import 'package:goalnow_app/screen/home/widget/build_highlight.dart';
import 'package:goalnow_app/screen/home/widget/build_news.dart';
import 'package:goalnow_app/screen/home/widget/side_menu_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppScaffold(
        overlayOpacity: 0.85,
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
        body: Column(
          mainAxisAlignment: .start,
          crossAxisAlignment: .center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  children: [
                    /// Featured Matches
                     const SizedBox(height: 6),
                    AppSectionHeader(
                      title: 'Featured Matches',
                      showAction: true,
                      actionText: 'See more',
                      onTap: () {
                        Navigator.pushNamed(context, AppRoute.matchs);
                      },
                    ),
                    const BuildFeaturedMatch(maxItems: 4),

                    const SizedBox(height: 6),
                    /// News
                    AppSectionHeader(
                      title: 'Hot News',
                      showAction: true,
                      actionText: 'See more',
                      onTap: () => Navigator.pushNamed(context, AppRoute.news),
                    ),
                    const BuildNews(),

                    const SizedBox(height: 12),
                    /// Highlights
                    AppSectionHeader(
                      title: 'Latest Highlights',
                      showAction: true,
                      actionText: 'See more',
                      onTap: () =>
                          Navigator.pushNamed(context, AppRoute.highlight),
                    ),

                    const BuildLatestHighlights(),

                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ],
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
            child: SideMenuContent(width: context.sw * 0.7, side: side),
          ),
        );
      },
    );
  }
}
