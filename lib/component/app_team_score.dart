import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';

class AppTeamScore extends StatelessWidget {
  final String name;
  final String logoUrl;
  final int score;
  final bool alignEnd;

  const AppTeamScore({
    super.key,
    required this.name,
    required this.logoUrl,
    required this.score,
    this.alignEnd = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment:
            alignEnd ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!alignEnd) _logo(),
          const SizedBox(width: 6),
          Flexible(
            child: AppText(
              text: name,
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
              style: AppTextStyle.h2,
            ),
          ),
          const SizedBox(width: 6),
          AppText(
            text: '$score',
            style: AppTextStyle.h3.copyWith(
              color: AppColor.primary,
            ),
          ),
          if (alignEnd) ...[
            const SizedBox(width: 6),
            _logo(),
          ],
        ],
      ),
    );
  }

  Widget _logo() {
    return CircleAvatar(
      radius: 14,
      backgroundColor: AppColor.background,
      backgroundImage: NetworkImage(logoUrl),  
      onBackgroundImageError: (_, _) {},  
      child: const Icon(Icons.shield, color: Colors.white, size: 14),  
    );
  }
}
