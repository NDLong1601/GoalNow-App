import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/core/enum/enum.dart';
import 'package:goalnow_app/routes/app_route.dart';

class SideMenuContent extends StatelessWidget {
  final double width;
  final PanelSide side;

  const SideMenuContent({super.key, required this.width, required this.side});

  void _goTo(BuildContext context, String routeName) {
    // Close the side panel before navigating
    Navigator.pop(context);
    Navigator.pushNamed(context, routeName);
  }

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

            MenuItem(
              title: 'Transfers',
              onTap: () => _goTo(context, AppRoute.transfers),
            ),
            MenuItem(
              title: 'Standings',
              // onTap: () => _goTo(context, AppRoute.standings),
            ),
            MenuItem(
              title: 'Player',
              // onTap: () => _goTo(context, AppRoute.player),
            ),
            MenuItem(
              title: 'Leagues',
              // onTap: () => _goTo(context, AppRoute.leagues),
            ),
            MenuItem(
              title: 'Friends',
              // onTap: () => _goTo(context, AppRoute.friends),
            ),
          ],
        ),
      ),
    );
  }
}


class MenuItem extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const MenuItem({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: AppText(
          text: title.toUpperCase(),
          style: AppTextStyle.inputLabel.copyWith(letterSpacing: 0.5),
        ),
      ),
    );
  }
}
