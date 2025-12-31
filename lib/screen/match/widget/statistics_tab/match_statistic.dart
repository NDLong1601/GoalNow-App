import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/provider/match_stats_provider.dart';
import 'package:goalnow_app/screen/match/widget/statistics_tab/match_stat_section_expandable.dart';
import 'package:provider/provider.dart';

class MatchStatistic extends StatelessWidget {
  const MatchStatistic({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MatchStatsProvider>(
      builder: (context, provider, _) {
        // Loading
        if (provider.loading) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        // Error
        if (provider.error != null) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: AppText(
              text: provider.error!,
              style: AppTextStyle.bodySmall.copyWith(color: Colors.red),
            ),
          );
        }
        // No statistics
        if (provider.sections.isEmpty) {
          return const Center(child: Text('No statistics available'));
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: provider.sections.map((section) {
            final bool openByDefault = section.key == 'top_stats';
            return MatchStatSectionExpandable(
              section: section,
              initialExpanded: openByDefault,
            );
          }).toList(),
        );
      },
    );
  }
}
