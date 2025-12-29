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
        margin: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 2,
            color: AppColor.primary,
            strokeAlign: CircularProgressIndicator.strokeAlignCenter,
          ),
        ),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColor.primary, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1),
                    child: CircleAvatar(
                      backgroundImage: resolveAvatar(user.avatarUrl),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 1,
                  right: 1,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColor.background, width: 2),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.name, style: AppTextStyle.h3),
                const SizedBox(height: 4),
                Text(
                  FormatHelper.formatEmail(user.email),
                  style: AppTextStyle.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
