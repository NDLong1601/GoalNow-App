import 'package:flutter/material.dart';
import 'package:goalnow_app/core/const/app_asset_path.dart';
import 'package:goalnow_app/core/const/app_color.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  /// Thay ảnh theo màn
  final String? imagePath;

  final double overlayOpacity;

  const AppBackground({
    super.key,
    required this.child,
    this.imagePath,
    this.overlayOpacity = 0.55,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            imagePath ?? AppAssetsPath.cover,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            color: AppColor.background.withValues(alpha: overlayOpacity),
          ),
        ),
        SafeArea(child: child),
      ],
    );
  }
}
