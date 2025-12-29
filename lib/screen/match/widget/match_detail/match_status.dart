import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/utils/date_helper.dart';
import 'package:goalnow_app/model/match/match.dart';

class MatchStatus extends StatelessWidget {
  final MatchModel match;
  const MatchStatus({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _statusChip(
            match.status.finished ? 'FT' : 'LIVE',
            match.status.finished ? Colors.white : Colors.red,
          ),
          const SizedBox(width: 12),
          AppText(
            text:
                '${DateHelper.groupLabel(match.time)} - ${DateHelper.timeOnly(match.time)}',
            style: AppTextStyle.bodySmall.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _statusChip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: AppText(
        text: text,
        style: AppTextStyle.bodySmall.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
