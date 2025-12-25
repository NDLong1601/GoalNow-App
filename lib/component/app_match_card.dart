import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_team_logo.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/core/network/api_client.dart';
import 'package:goalnow_app/model/match/match.dart';
import 'package:goalnow_app/provider/match_stats_provider.dart';
import 'package:goalnow_app/repository/match_stats_repository.dart';
import 'package:goalnow_app/screen/match/match_detail_screen.dart';
import 'package:goalnow_app/service/api/stats_service.dart';
import 'package:provider/provider.dart';

class AppMatchCard extends StatelessWidget {
  final MatchModel match;

  final String league;
  final String statusText;
  final bool showScore;
  final bool isLive;
  final bool isHighHeat;

  final String homeName;
  final String homeLogo;
  final int homeScore;

  final String awayName;
  final String awayLogo;
  final int awayScore;

  const AppMatchCard({
    super.key,
    required this.match,
    required this.league,
    required this.statusText,
    this.showScore = true,
    required this.isLive,
    required this.isHighHeat,
    required this.homeName,
    required this.homeLogo,
    required this.homeScore,
    required this.awayName,
    required this.awayLogo,
    required this.awayScore,
  });

  @override
  Widget build(BuildContext context) {
    final bool canNavigate = isLive || match.status.finished;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: canNavigate
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChangeNotifierProvider(
                    create: (_) => MatchStatsProvider(
                      MatchStatsRepository(MatchStatsService(ApiClient())),
                    )..fetchStats(match.id),
                    child: MatchDetailScreen(match: match),
                  ),
                ),
              );
            }
          : null,
      child: Opacity(
        opacity: canNavigate ? 1.0 : 0.65,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColor.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColor.primary.withValues(alpha: 0.6)),
          ),
          child: Column(
            children: [
              /// League name (optional)
              if (league.isNotEmpty)
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    text: league,
                    maxLines: 2,
                    style: AppTextStyle.bodySmall.copyWith(
                      color: AppColor.white.withValues(alpha: 0.6),
                    ),
                  ),
                ),

              const SizedBox(height: 12),

              Row(
                children: [
                  _team(name: homeName, logo: homeLogo, alignRight: false),

                  Column(
                    children: [
                      AppText(
                        text: showScore
                            ? '$homeScore - $awayScore'
                            : statusText,
                        style: AppTextStyle.h2,
                      ),
                      const SizedBox(height: 6),

                      /// Finished / Live → status badge
                      if (showScore) _statusBadge(),
                    ],
                  ),

                  _team(name: awayName, logo: awayLogo, alignRight: true),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // TEAM BLOCK
  Widget _team({
    required String name,
    required String logo,
    required bool alignRight,
  }) {
    return Expanded(
      child: Row(
        mainAxisAlignment: alignRight
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!alignRight) TeamLogo(assetPath: logo, size: 24),

          const SizedBox(width: 8),

          Flexible(
            child: AppText(
              text: name,
              maxLines: 2,
              textAlign: alignRight ? TextAlign.end : TextAlign.start,
              textOverflow: TextOverflow.ellipsis,
              style: AppTextStyle.bodySmall.copyWith(color: Colors.white),
            ),
          ),

          if (alignRight) ...[
            const SizedBox(width: 8),
            TeamLogo(assetPath: logo, size: 24),
          ],
        ],
      ),
    );
  }

  // STATUS BADGE (LIVE / FT)
  Widget _statusBadge() {
    final Color color = isLive ? Colors.red : Colors.white54;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: AppText(
        text: statusText,
        style: AppTextStyle.bodySmall.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
