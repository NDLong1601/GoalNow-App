import 'package:flutter/material.dart';
import 'package:goalnow_app/core/const/app_color.dart';

class BellIconButton extends StatelessWidget {
  final VoidCallback onTap;

  const BellIconButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        height: 34,
        width: 34,
        decoration: BoxDecoration(
          color: AppColor.surface.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColor.primary.withValues(alpha: 0.6),
            width: 1,
          ),
        ),
        child: Icon(
          Icons.notifications_none_rounded,
          size: 18,
          color: AppColor.primary,
        ),
      ),
    );
  }
}