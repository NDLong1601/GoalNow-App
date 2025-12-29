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
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColor.primary, width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: CircleAvatar(backgroundImage: resolveAvatar(user.avatarUrl)),
          ),
        ),

        const SizedBox(height: 12),
        AppButton(
          text: 'Change avatar',
          type: AppButtonType.primary,
          height: 50,
          width: 200,
          prefixIconPath: AppAssetsPath.camera,
          onPressed: () {},
        ),
      ],
    );
  }
}
