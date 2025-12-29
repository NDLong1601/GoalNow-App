import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_match_card.dart';
import 'package:goalnow_app/core/data/data.dart';
import 'package:goalnow_app/core/utils/logo_helper.dart';
import 'package:goalnow_app/provider/match_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BuildFeaturedMatch extends StatelessWidget {
  final int maxItems;

  const BuildFeaturedMatch({super.key, this.maxItems = 4});

  @override
  Widget build(BuildContext context) {
    return Consumer<MatchProvider>(
      builder: (context, provider, _) {
        if (provider.loading) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final matches = provider.matches;
        if (matches.isEmpty) return const SizedBox.shrink();

        final count = matches.length > maxItems ? maxItems : matches.length;

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: count,
          itemBuilder: (context, index) {
            final match = matches[index];

            final isLive = match.status.started && !match.status.finished;
            final isFinished = match.status.finished;

            final statusText = isFinished
                ? 'FT'
                : (isLive ? 'LIVE' : DateFormat('HH:mm').format(match.time));

            return AppMatchCard(
              match: match,
              league: Data.getLeagueName(match.leagueId),
              statusText: statusText,
              showScore: isLive || isFinished,
              isLive: isLive,
              isHighHeat: isLive,
              homeName: match.home.name,
              homeLogo: LogoIconMapper.getLogo(match.home.name) ?? '',
              homeScore: match.home.score,
              awayName: match.away.name,
              awayLogo: LogoIconMapper.getLogo(match.away.name) ?? '',
              awayScore: match.away.score,
            );
          },
        );
      },
    );
  }
}
