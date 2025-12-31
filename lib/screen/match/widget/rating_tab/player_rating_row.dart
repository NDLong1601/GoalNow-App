import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/model/lineup/lineup_player.dart';

class PlayerRatingRow extends StatelessWidget {
  final LineupPlayer player;

  const PlayerRatingRow({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    final rating = player.rating;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          // AVATAR
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColor.white,
            child: AppText(
              text: player.shirtNumber,
              style: AppTextStyle.bodySmall.copyWith(color: Colors.black),
            ),
          ),

          const SizedBox(width: 12),

          // PLAYER NAME
          Expanded(
            child: AppText(
              text: player.name,
              style: AppTextStyle.bodySmall.copyWith(
                color: AppColor.white.withValues(alpha: 0.9),
              ),
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
            ),
          ),

          // RATING
          SizedBox(
            width: 44,
            child: Align(
              alignment: Alignment.centerRight,
              child: AppText(
                text: rating != null ? rating.toStringAsFixed(1) : '-',
                style: AppTextStyle.h3.copyWith(
                  fontWeight: FontWeight.w700,
                  color: _ratingColor(rating),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _ratingColor(double? rating) {
    if (rating == null) return AppColor.textSecondary;
    if (rating >= 9) return Colors.blueAccent;
    if (rating >= 7) return AppColor.primary;
    if (rating >= 6) return const Color(0xFFF5B942);
    return const Color(0xFFE5533D);
  }
}
