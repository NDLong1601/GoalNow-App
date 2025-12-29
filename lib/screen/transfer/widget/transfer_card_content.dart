import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/core/utils/format_helper.dart';
import 'package:goalnow_app/model/transfer/transfer.dart';
import 'package:goalnow_app/screen/transfer/widget/club_info.dart';
import 'package:goalnow_app/screen/transfer/widget/player_avatar.dart';
import 'package:goalnow_app/screen/transfer/widget/player_position_badge.dart';

class TransferCardContent extends StatelessWidget {
  final TransferModel transfer;

  const TransferCardContent({super.key, required this.transfer});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Hero(
                  tag: 'player_${transfer.playerId}',
                  child: PlayerAvatar(
                    playerKey: transfer.playerId.toString(),
                    clubName: transfer.toClub,
                    size: 52,
                  ),
                ),
                Positioned(
                  bottom: -5,
                  right: -5,
                  child: PlayerPositionBadge(
                    label: transfer.position.label,
                    positionKey: transfer.position.key,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            SizedBox(
              width: 72,
              child: AppText(
                text: FormatHelper.formatPlayerName(transfer.name),
                style: AppTextStyle.bodySmall,
                maxLines: 2,
                textAlign: TextAlign.center,
                textOverflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClubInfo(name: transfer.fromClub),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      size: 18,
                      color: AppColor.white,
                    ),
                  ),
                  ClubInfo(name: transfer.toClub),
                ],
              ),

              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: transfer.onLoan
                        ? 'ON LOAN'
                        : transfer.fee.feeText.toUpperCase(),
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    style: AppTextStyle.caption.copyWith(
                      color: AppColor.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppText(
                    text:
                        'Value Market : ${FormatHelper.formatCurrency(transfer.marketValue)}',
                    style: AppTextStyle.caption.copyWith(color: AppColor.white),
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
