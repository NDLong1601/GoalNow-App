import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/core/utils/avatar_helper.dart';
import 'package:goalnow_app/provider/user_provider.dart';
import 'package:goalnow_app/core/utils/format_helper.dart';
import 'package:goalnow_app/routes/app_route.dart';
import 'package:provider/provider.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;

    if (user == null) {
      return const SizedBox.shrink();
    }

    return InkWell(
      onTap: () => {Navigator.pushNamed(context, AppRoute.profile)},
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: resolveAvatar(user.avatarUrl),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.name, style: AppTextStyle.h3),
                const SizedBox(height: 4),
                Text(formatEmail(user.email), style: AppTextStyle.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
