import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/model/transfer/transfer.dart';
import 'package:goalnow_app/screen/transfer/widget/player_avatar.dart';
import 'package:goalnow_app/screen/transfer/widget/player_position_badge.dart';

class PlayerHeader extends StatelessWidget {
  final TransferModel transfer;

  const PlayerHeader(this.transfer, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Hero(
          tag: 'player_${transfer.playerId}',
          child: PlayerAvatar(
            playerKey: transfer.playerId.toString(),
            clubName: transfer.toClub,
            size: 60,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: transfer.name,
                style: AppTextStyle.h3,
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  PlayerPositionBadge(
                    label: transfer.position.label,
                    positionKey: transfer.position.key,
                  ),
                  const SizedBox(width: 8),
                  AppText(
                    text: transfer.position.key
                        .replaceAll('_', ' ')
                        .toUpperCase(),
                    style: AppTextStyle.caption.copyWith(
                      color: Colors.white70,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PositionBadge extends StatelessWidget {
  final String label;

  const PositionBadge(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: AppColor.primary.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: AppText(
        text: label,
        style: AppTextStyle.caption.copyWith(
          color: AppColor.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
