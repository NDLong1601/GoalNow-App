import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/core/enum/enum.dart';

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


class MenuItem extends StatelessWidget {
  final String title;

  const MenuItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: AppText(
        text: title.toUpperCase(),
        style: AppTextStyle.inputLabel.copyWith(letterSpacing: 0.5),
      ),
    );
  }
}