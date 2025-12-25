import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/core/enum/enum.dart';
import 'package:goalnow_app/provider/transfer_provider.dart';
import 'package:provider/provider.dart';

class BottomSheetFillter extends StatelessWidget {
  const BottomSheetFillter({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TransferProvider>();

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SheetHandle(),
          const SizedBox(height: 16),

          AppText(text: 'Sort by market value', style: AppTextStyle.h3),
          const SizedBox(height: 12),

          _SortOption(
            title: 'Value: Low to High',
            selected: provider.sort == TransferSort.valueAsc,
            onTap: () {
              provider.setSort(TransferSort.valueAsc);
              Navigator.pop(context);
            },
          ),
          _SortOption(
            title: 'Value: High to Low',
            selected: provider.sort == TransferSort.valueDesc,
            onTap: () {
              provider.setSort(TransferSort.valueDesc);
              Navigator.pop(context);
            },
          ),
          _SortOption(
            title: 'Default',
            selected: provider.sort == TransferSort.none,
            onTap: () {
              provider.setSort(TransferSort.none);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

/// Sort option widget
class _SortOption extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _SortOption({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: selected
              ? AppColor.primary.withValues(alpha: 0.12)
              : AppColor.surfaceElevated,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected
                ? AppColor.primary
                : AppColor.divider.withValues(alpha: 0.4),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: AppText(
                text: title,
                style: AppTextStyle.bodySmall.copyWith(
                  color: selected ? AppColor.primary : AppColor.textPrimary,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
            if (selected)
              const Icon(Icons.check_circle_rounded, color: AppColor.primary),
          ],
        ),
      ),
    );
  }
}

/// Sheet handle widget
class _SheetHandle extends StatelessWidget {
  const _SheetHandle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: AppColor.white.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}
