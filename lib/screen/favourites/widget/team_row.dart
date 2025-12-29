import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/screen/favourites/widget/team_avatar.dart';

class TeamRow extends StatelessWidget {
  final String teamName;
  final int? score;
  final bool highlightScore;

  const TeamRow({super.key, 
    required this.teamName,
    required this.score,
    required this.highlightScore,
  });

  @override
  Widget build(BuildContext context) {
    final scoreText = score?.toString() ?? '';
    return Row(
      children: [
        TeamAvatar(
          size: 26,
          child: Text(
            teamName.isNotEmpty ? teamName.characters.first : '?',
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
          ),
        ),
        const SizedBox(width: 10),
        AppText(
          text: teamName,
          style: AppTextStyle.bodyLarge.copyWith(fontWeight: FontWeight.w700),
          maxLines: 1,
        ),
        Spacer(),
        if (score != null)
          AppText(
            text: scoreText,
            style: AppTextStyle.h2.copyWith(
              color: highlightScore ? AppColor.primary : Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
      ],
    );
  }
}