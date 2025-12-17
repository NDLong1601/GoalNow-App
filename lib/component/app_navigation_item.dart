import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';

class AppNavigationItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData? leadingIcon;

  const AppNavigationItem({
    super.key,
    required this.title,
    required this.onTap,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        child: Row(
          children: [
            if (leadingIcon != null) ...[
              Icon(
                leadingIcon,
                size: 20,
                color: AppColor.textSecondary,
              ),
              const SizedBox(width: 12),
            ],

            Expanded(
              child: Text(
                title,
                style: AppTextStyle.bodyLarge,
              ),
            ),

            const Icon(
              Icons.chevron_right,
              size: 20,
              color: AppColor.textMuted,
            ),
          ],
        ),
      ),
    );
  }
}
