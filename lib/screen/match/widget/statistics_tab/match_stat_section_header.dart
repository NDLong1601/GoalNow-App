import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';

class MatchStatSectionHeader extends StatelessWidget {
  final String title;
  final bool expanded;
  final VoidCallback onToggle;

  const MatchStatSectionHeader({
    super.key,
    required this.title,
    required this.expanded,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onToggle,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 14, 0, 10),
        child: Row(
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(9),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: AppText(
                text: title,
                style: AppTextStyle.bodyLarge.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            AnimatedRotation(
              turns: expanded ? 0.5 : 0.0,
              duration: const Duration(milliseconds: 180),
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
