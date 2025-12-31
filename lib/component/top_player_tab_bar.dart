import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/core/enum/enum.dart';

class TopPlayerTabBar extends StatelessWidget {
  final TopPlayerTab current;
  final ValueChanged<TopPlayerTab> onChanged;
  final VoidCallback onFilterPressed;

  const TopPlayerTabBar({
    super.key,
    required this.current,
    required this.onChanged,
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
      child: Row(
        children: [
          /// TAB BAR
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColor.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColor.primary),
              ),
              child: Row(
                children: TopPlayerTab.values.map((tab) {
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
          ),

          const SizedBox(width: 10),

          /// FILTER ICON
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onFilterPressed,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColor.primaryDark,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.list, color: AppColor.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  String _label(TopPlayerTab tab) {
    switch (tab) {
      case TopPlayerTab.goal:
        return 'Goals';
      case TopPlayerTab.assist:
        return 'Assists';
    }
  }
}
