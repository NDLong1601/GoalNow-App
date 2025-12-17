import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_button.dart';
import 'package:goalnow_app/core/const/app_asset_path.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/core/enum/enum.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppButton(
          type: AppButtonType.social,
          iconAssetPath: AppAssetsPath.google,
          height: 48,
          width: 48,
          radius: 10,
          backgroundColorOverride: Colors.white,
          borderColorOverride: AppColor.divider,
          onPressed: () {},
        ),
        const SizedBox(width: 14),
        AppButton(
          type: AppButtonType.social,
          iconAssetPath: AppAssetsPath.facebook,
          height: 48,
          width: 48,
          radius: 10,
          backgroundColorOverride: Colors.white,
          borderColorOverride: AppColor.divider,
          onPressed: () {},
        ),
        const SizedBox(width: 14),
        AppButton(
          type: AppButtonType.social,
          iconAssetPath: AppAssetsPath.apple,
          height: 48,
          width: 48,
          radius: 10,
          backgroundColorOverride: Colors.white,
          borderColorOverride: AppColor.divider,
          onPressed: () {},
        ),
      ],
    );
  }
}
