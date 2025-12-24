import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/screen/favourites/favourites_screen.dart';
import 'package:goalnow_app/screen/favourites/widget/status_pill.dart';

class MatchCard extends StatelessWidget {
  final MatchCardData data;
  const MatchCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.surface.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.06),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status row
          Row(
            children: [
              StatusPill(
                text: data.isLive ? 'Live' : 'Upcoming',
                isLive: data.isLive,
              ),
              const Spacer(),
              AppText(
                text: data.statusRightText,
                style: AppTextStyle.bodySmall.copyWith(
                  color: Colors.white60,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Teams rows
          TeamRow(
            teamName: data.homeTeam,
            score: data.homeScore,
            highlightScore: data.isLive,
          ),
          const SizedBox(height: 10),
          TeamRow(
            teamName: data.awayTeam,
            score: data.awayScore,
            highlightScore: data.isLive,
          ),

          const Spacer(),

          AppText(
            text: data.league,
            style: AppTextStyle.bodySmall.copyWith(
              color: Colors.white60,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}