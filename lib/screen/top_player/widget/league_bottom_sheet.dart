import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_asset_path.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/core/data/data.dart';
import 'package:goalnow_app/core/extension/context_extension.dart';
import 'package:goalnow_app/provider/top_player_provider.dart';

void showLeagueBottomSheet(BuildContext context, TopPlayerProvider provider) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => _LeagueBottomSheet(provider: provider),
  );
}

class _LeagueBottomSheet extends StatelessWidget {
  final TopPlayerProvider provider;

  const _LeagueBottomSheet({required this.provider});

  @override
  Widget build(BuildContext context) {
    final leagueIds = Data.leagueNameMap.keys.toList()
      ..sort(
        (a, b) =>
            Data.getLeaguePriority(a).compareTo(Data.getLeaguePriority(b)),
      );

    return Container(
      height: context.sh * 0.6,
      decoration: const BoxDecoration(
        color: AppColor.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          /// Drag handle
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 8),
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          /// Title
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: AppText(
              text: 'Select League',
              style: AppTextStyle.bodySmall.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          /// List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: leagueIds.length,
              itemBuilder: (_, index) {
                final leagueId = leagueIds[index];
                final isSelected = provider.leagueId == leagueId;

                return _LeagueItem(
                  title: Data.getLeagueName(leagueId),
                  selected: isSelected,
                  onTap: () {
                    provider.changeLeague(leagueId);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _LeagueItem extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _LeagueItem({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: selected
              ? AppColor.primaryDark.withValues(alpha: 0.35)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Image.asset(AppAssetsPath.ball, color: AppColor.white),
            ),

            /// Text
            AppText(
              text: title,
              style: AppTextStyle.bodyLarge.copyWith(
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                color: selected
                    ? AppColor.white
                    : AppColor.white.withValues(alpha: 0.7),
              ),
            ),

            const Spacer(),

            /// Check icon
            SizedBox(
              width: 24,
              child: selected
                  ? const Icon(Icons.check, size: 20, color: Colors.greenAccent)
                  : null,
            ),
            SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
