import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';

class EmptyState extends StatelessWidget {
  final String message;
  final IconData icon;

  const EmptyState({
    super.key,
    this.message = 'Waiting ....',
    this.icon = Icons.hourglass_empty,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 100, color: AppColor.white.withValues(alpha: 0.6)),

          const SizedBox(height: 12),

          /// TEXT
          AppText(
            text: message,
            style: AppTextStyle.bodyLarge.copyWith(
              color: AppColor.white.withValues(alpha: 0.85),
            ),
          ),
        ],
      ),
    );
  }
}
