import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_scaffold.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/core/enum/enum.dart';
import 'package:goalnow_app/core/network/api_client.dart';
import 'package:goalnow_app/model/match/match.dart';
import 'package:goalnow_app/provider/lineup_provider.dart';
import 'package:goalnow_app/provider/match_stats_provider.dart';
import 'package:goalnow_app/repository/lineup_repository.dart';
import 'package:goalnow_app/repository/match_stats_repository.dart';
import 'package:goalnow_app/screen/match/widget/match_detail/match_detail_header.dart';
import 'package:goalnow_app/screen/match/widget/line_up_tab/match_lineups.dart';
import 'package:goalnow_app/screen/match/widget/match_detail/match_status.dart';
import 'package:goalnow_app/screen/match/widget/statistics_tab/match_statistic.dart';
import 'package:goalnow_app/screen/match/widget/match_detail/match_detail_tabbar.dart';
import 'package:goalnow_app/service/api/lineup_service.dart';
import 'package:provider/provider.dart';

class MatchDetailScreen extends StatefulWidget {
  final MatchModel match;
  const MatchDetailScreen({super.key, required this.match});

  @override
  State<MatchDetailScreen> createState() => _MatchDetailScreenState();
}

class _MatchDetailScreenState extends State<MatchDetailScreen> {
  MatchDetailTab _tab = MatchDetailTab.statistics;

  @override
  Widget build(BuildContext context) {
    final match = widget.match;

    return AppScaffold(
      overlayOpacity: 0.95,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        elevation: 0,
        title: AppText(
          text: '${match.home.name} vs ${match.away.name}',
          style: AppTextStyle.bodyLarge,
        ),
      ),
      body: Column(
        children: [
          MatchDetailHeader(match: match),
          MatchStatus(match: match),
          const Divider(height: 1),
          // Tabbar
          MatchDetailTabBar(
            current: _tab,
            onChanged: (tab) => setState(() => _tab = tab),
          ),

          // Content
          Expanded(
            child: IndexedStack(
              index: _tab.index,
              children: [
                // Statistics
                ChangeNotifierProvider(
                  create: (context) =>
                      MatchStatsProvider(context.read<MatchStatsRepository>())
                        ..fetchStats(match.id),
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                    children: const [MatchStatistic()],
                  ),
                ),

                // Lineups
                ChangeNotifierProvider(
                  create: (_) => LineupProvider(
                    LineupRepository(LineupService(ApiClient())),
                  ),
                  child: MatchLineups(eventId: match.id),
                ),

                // Ratings
                ListView(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                  children: const [
                    SizedBox(height: 12),
                    Center(child: Text('Ratings (coming soon)')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
