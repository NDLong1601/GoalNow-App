import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/core/enum/enum.dart';

class MatchDetailTabBar extends StatelessWidget {
  final MatchDetailTab current;
  final ValueChanged<MatchDetailTab> onChanged;

  const MatchDetailTabBar({
    super.key,
    required this.current,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColor.surface,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: MatchDetailTab.values.map((tab) {
            final active = tab == current;

            return Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => onChanged(tab),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: active ? AppColor.primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: AppText(
                      text: _label(tab),
                      style: AppTextStyle.bodySmall.copyWith(
                        fontWeight: FontWeight.w600,
                        color: active
                            ? AppColor.white
                            : AppColor.white.withValues(alpha: 0.7),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  String _label(MatchDetailTab tab) {
    switch (tab) {
      case MatchDetailTab.statistics:
        return 'Statistics';
      case MatchDetailTab.lineups:
        return 'Lineups';
      case MatchDetailTab.ratings:
        return 'Ratings';
    }
  }
}
