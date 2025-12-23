import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/model/match.dart';
import 'package:goalnow_app/screen/match/match_detail_screen.dart';

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
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => MatchDetailScreen(match: match)),
        );
      },
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
                      text: showScore ? '$homeScore - $awayScore' : statusText,
                      style: AppTextStyle.h2,
                    ),
                    const SizedBox(height: 6),
                    if (showScore) _statusBadge(),
                  ],
                ),

                _team(name: awayName, logo: awayLogo, alignRight: true),
              ],
            ),
          ],
        ),
      ),
    );
  }

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
          if (!alignRight) _logo(logo),
          const SizedBox(width: 8),
          Flexible(
            child: AppText(
              text: name,
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
              style: AppTextStyle.bodySmall,
            ),
          ),
          if (alignRight) ...[const SizedBox(width: 8), _logo(logo)],
        ],
      ),
    );
  }

  Widget _logo(String url) {
    if (url.trim().isEmpty) {
      return CircleAvatar(
        radius: 14,
        backgroundColor: AppColor.background,
        child: const Icon(Icons.shield, size: 16),
      );
    }

    return CircleAvatar(
      radius: 14,
      backgroundColor: AppColor.background,
      backgroundImage: NetworkImage(url),
      onBackgroundImageError: (_, _) {},
    );
  }

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
