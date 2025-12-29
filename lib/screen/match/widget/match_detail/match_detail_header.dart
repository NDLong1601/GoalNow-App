import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_team_logo.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/utils/logo_helper.dart';
import 'package:goalnow_app/model/match/match.dart';

class MatchDetailHeader extends StatelessWidget {
  const MatchDetailHeader({super.key, required this.match});
  final MatchModel match;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _teamBlock(match.home.name, false),
          Expanded(
            child: Column(
              children: [
                AppText(
                  text: '${match.home.score} - ${match.away.score}',
                  style: AppTextStyle.h1,
                ),
                const SizedBox(height: 4),
                AppText(
                  text: match.status.finished ? 'Full Time' : 'Live',
                  style: AppTextStyle.bodySmall.copyWith(
                    color: match.status.finished ? Colors.white54 : Colors.red,
                  ),
                ),
              ],
            ),
          ),
          _teamBlock(match.away.name, true),
        ],
      ),
    );
  }

  Widget _teamBlock(String name, bool alignRight) {
    return Expanded(
      child: Column(
        crossAxisAlignment: alignRight
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          TeamLogo(
            assetPath: LogoIconMapper.getLogo(name) ?? '',
            size: 44,
            borderWidth: 1.5,
          ),
          const SizedBox(height: 8),
          AppText(
            text: name,
            maxLines: 2,
            textOverflow: TextOverflow.ellipsis,
            style: AppTextStyle.bodySmall.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
