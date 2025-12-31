import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/provider/top_player_provider.dart';

class TopPlayerList extends StatelessWidget {
  const TopPlayerList({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TopPlayerProvider>();
    final players = provider.currentList;

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      itemCount: players.length,
      separatorBuilder: (_, _) => const SizedBox(height: 8),
      itemBuilder: (_, index) {
        final p = players[index];

        return InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColor.textPrimary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                /// RANK
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.surface,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: 40,
                  height: 40,
                  child: Center(
                    child: AppText(
                      text: '${index + 1}',
                      style: AppTextStyle.bodyLarge.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                /// INFO
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: p.base.name,
                        style: AppTextStyle.bodySmall.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColor.black,
                        ),
                      ),
                      const SizedBox(height: 2),
                      AppText(
                        text: p.teamName,
                        style: AppTextStyle.caption.copyWith(
                          color: AppColor.black,
                        ),
                      ),
                    ],
                  ),
                ),

                /// VALUE
                Container(
                  width: 40,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.primary.withValues(alpha: 0.85),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: AppText(
                    text: p.value.toString(),
                    style: AppTextStyle.bodySmall.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColor.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
