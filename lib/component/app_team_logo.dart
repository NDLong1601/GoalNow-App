import 'package:flutter/material.dart';
import 'package:goalnow_app/core/const/app_color.dart';

class TeamLogo extends StatelessWidget {
  final String assetPath;
  final double size;
  final double borderWidth;
  final Color borderColor;
  final Color backgroundColor;

  const TeamLogo({
    super.key,
    required this.assetPath,
    this.size = 26,
    this.borderWidth = 1,
    this.borderColor = Colors.white,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    if (assetPath.trim().isEmpty) {
      return _fallback();
    }

    return SizedBox(
      height: size,
      width: 30,
      // decoration: BoxDecoration(
      //   shape: BoxShape.circle,
      //   // color: backgroundColor,
      //   // boxShadow: [BoxShadow(color: Colors.white, blurRadius: 4)],
      //   // border: Border.all(color: borderColor, width: borderWidth),
      // ),
      child: ClipOval(child: Image.asset(assetPath, fit: BoxFit.contain)),
    );
  }

  Widget _fallback() {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColor.background,
        border: Border.all(
          color: borderColor.withValues(alpha: 0.6),
          width: borderWidth,
        ),
      ),
      child: Icon(Icons.shield, size: size * 0.55, color: Colors.white),
    );
  }
}
