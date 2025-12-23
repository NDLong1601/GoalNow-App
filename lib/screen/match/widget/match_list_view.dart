import 'package:flutter/material.dart';
import 'package:goalnow_app/core/enum/enum.dart';
import 'package:goalnow_app/core/utils/date_helper.dart';
import 'package:goalnow_app/model/match.dart';
import 'package:goalnow_app/component/app_match_card.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import '../helper/match_group_helper.dart';

class MatchListView extends StatelessWidget {
  final MatchTab tab;
  final List<MatchModel> matches;
  final Map<int, String> leagueNameMap;
  final Map<int, int> leaguePriority;

  const MatchListView({
    super.key,
    required this.tab,
    required this.matches,
    required this.leagueNameMap,
    required this.leaguePriority,
  });

  @override
  Widget build(BuildContext context) {
    final filtered = MatchGroupHelper.filterByTab(matches, tab)
      ..sort((a, b) => a.time.compareTo(b.time));

    final grouped = tab == MatchTab.upcoming
        ? MatchGroupHelper.groupUpcomingByDate(filtered)
        : MatchGroupHelper.groupByLeague(
            matches: filtered,
            leagueNameMap: leagueNameMap,
            leaguePriority: leaguePriority,
          );

    return CustomScrollView(
      slivers: grouped.entries.map((entry) {
        final title = MatchGroupHelper.sectionTitle(key: entry.key, tab: tab);

        return SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(title),
              ...entry.value.map(
                (match) => AppMatchCard(
                  match: match,
                  league: '',
                  statusText: tab == MatchTab.upcoming
                      ? DateHelper.timeOnly(match.time)
                      : (match.status.finished ? 'FT' : 'LIVE'),
                  showScore: tab != MatchTab.upcoming,
                  isLive: tab == MatchTab.live,
                  isHighHeat: false,
                  homeName: match.home.name,
                  homeLogo: '',
                  homeScore: match.home.score,
                  awayName: match.away.name,
                  awayLogo: '',
                  awayScore: match.away.score,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _header(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 18,
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          AppText(
            text: title,
            style: AppTextStyle.bodyLarge.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
