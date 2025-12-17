import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_button.dart';
import 'package:goalnow_app/core/const/app_asset_path.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/core/enum/enum.dart';
import 'package:goalnow_app/core/utils/avatar_helper.dart';
import 'package:goalnow_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    if (user == null) return const SizedBox.shrink();

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 104,
              height: 104,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColor.primary, width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: CircleAvatar(
                  backgroundImage: resolveAvatar(user.avatarUrl),
                ),
              ),
            ),

            Positioned(
              bottom: 6,
              right: 6,
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

        const SizedBox(height: 12),
        AppButton(
          text: 'Change avatar',
          type: AppButtonType.primary,
          height: 50,
          width: 170,
          prefixIconPath: AppAssetsPath.camera,
          onPressed: () {},
        ),
      ],
    );
  }
}
