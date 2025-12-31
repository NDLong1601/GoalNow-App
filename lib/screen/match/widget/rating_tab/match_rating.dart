import 'package:flutter/material.dart';
import 'package:goalnow_app/model/lineup/team_lineup.dart';
import 'package:goalnow_app/screen/match/widget/rating_tab/player_rating_row.dart';
import 'package:provider/provider.dart';

import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';

import 'package:goalnow_app/model/lineup/lineup_player.dart';
import 'package:goalnow_app/provider/lineup_provider.dart';
import 'package:goalnow_app/screen/match/widget/line_up_tab/lineup_switch.dart';

class MatchRatings extends StatelessWidget {
  const MatchRatings({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LineupProvider>(
      builder: (_, provider, _) {
        if (provider.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        final lineup = provider.currentLineup;
        if (lineup == null || lineup.starters.isEmpty) {
          return const Center(child: Text('No ratings available'));
        }

        // Sort players by rating desc
        final players = [...lineup.starters]
          ..sort((a, b) => (b.rating ?? 0).compareTo(a.rating ?? 0));

        final motm = _manOfTheMatchFromMatch(provider.home, provider.away);

        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          children: [
            // TOGGLE HOME / AWAY
            Row(
              children: [
                Icon(Icons.analytics_outlined, color: AppColor.iconPrimary),
                SizedBox(width: 12),
                AppText(text: 'Swap team'),
                Spacer(),
                LineupSwitch(),
              ],
            ),

            const SizedBox(height: 16),

            // MAN OF THE MATCH
            if (motm != null) ...[
              _ManOfTheMatchCard(player: motm),
              const SizedBox(height: 16),
            ],

            const Divider(height: 1),

            // PLAYER RATINGS
            ...players.map((p) => PlayerRatingRow(player: p)),
          ],
        );
      },
    );
  }

  LineupPlayer? _manOfTheMatchFromMatch(TeamLineup? home, TeamLineup? away) {
    // 
    final allPlayers = <LineupPlayer>[
      ...?home?.starters,
      ...?away?.starters,
    ].where((p) => p.rating != null).toList();

    if (allPlayers.isEmpty) return null;

    allPlayers.sort((a, b) => b.rating!.compareTo(a.rating!));
    return allPlayers.first;
  }
}

class _ManOfTheMatchCard extends StatelessWidget {
  final LineupPlayer player;

  const _ManOfTheMatchCard({required this.player});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColor.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.star, color: Color(0xFF3CCF91)),
          const SizedBox(width: 8),
          Expanded(
            child: AppText(
              text: 'MOTM: ${player.name}',
              style: AppTextStyle.bodySmall.copyWith(color: AppColor.black),
            ),
          ),
          AppText(
            text: player.rating!.toStringAsFixed(1),
            style: AppTextStyle.h3.copyWith(
              color: const Color(0xFF3CCF91),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
