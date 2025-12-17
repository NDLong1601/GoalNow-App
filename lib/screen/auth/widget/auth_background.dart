import 'package:flutter/material.dart';
import 'package:goalnow_app/core/const/app_asset_path.dart';
import 'package:goalnow_app/core/const/app_color.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Background image
        Positioned.fill(
          child: Image.asset(AppAssetsPath.cover, fit: BoxFit.cover),
        ),

        /// Dark overlay
        Positioned.fill(
          child: Container(color: AppColor.background.withValues(alpha: 0.55)),
        ),

        /// Foreground
        SafeArea(child: child),
      ],
    );
  }
}
