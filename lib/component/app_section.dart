import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';

class AppSectionHeader extends StatelessWidget {
  final String title;

  /// Action
  final bool showAction;
  final String actionText; // "See more" / "Xem thêm"
  final bool enabled;
  final VoidCallback? onTap;

  final bool showChevron;

  final EdgeInsetsGeometry padding;

  const AppSectionHeader({
    super.key,
    required this.title,
    this.showAction = true,
    this.actionText = 'See more',
    this.enabled = true,
    this.onTap,
    this.showChevron = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  });

  @override
  Widget build(BuildContext context) {
    final Color actionColor = enabled ? AppColor.primary : AppColor.textMuted;

    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyle.h2,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          if (showAction)
            InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: enabled ? onTap : null,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      actionText,
                      style: AppTextStyle.buttonSecondary.copyWith(
                        color: actionColor,
                      ),
                    ),
                    if (showChevron) ...[
                      const SizedBox(width: 4),
                      Icon(
                        Icons.chevron_right,
                        size: 16,
                        color: actionColor,
                      ),
                    ],
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
