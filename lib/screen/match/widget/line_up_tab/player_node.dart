import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/utils/format_helper.dart';
import 'package:goalnow_app/model/lineup/lineup_player.dart';

class PlayerNode extends StatelessWidget {
  final LineupPlayer player;
  const PlayerNode({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _avatarWithCaptainBadge(player),
        const SizedBox(height: 4),
        SizedBox(
          width: 64,
          child: AppText(
            text: FormatHelper.formatPlayerName(player.name),
            textAlign: TextAlign.center,
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 10, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _avatarWithCaptainBadge(LineupPlayer p) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: Colors.white,
          child: AppText(
            text: p.shirtNumber,
            style: AppTextStyle.bodySmall.copyWith(color: Colors.black),
          ),
        ),

        if (p.isCaptain)
          Positioned(
            right: -3,
            top: -3,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.75),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: const Text(
                'C',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
