import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';

class AppDivider extends StatelessWidget {
  final double horizontalPadding;

  const AppDivider({super.key, this.horizontalPadding = 16});

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 0.8,
      height: 1,
      indent: horizontalPadding,
      endIndent: horizontalPadding,
      color: AppColor.divider,
    );
  }
}

class OrDivider extends StatelessWidget {
  final String text;
  const OrDivider({super.key, this.text = 'or sign in using'});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColor.textMuted)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            text, // Use the parameter here
            style: AppTextStyle.bodySmall.copyWith(color: AppColor.white),
          ),
        ),
        Expanded(child: Divider(color: AppColor.textMuted)),
      ],
    );
  }
}
