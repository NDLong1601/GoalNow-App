import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/component/app_textstyle.dart';

class AppRichText extends StatelessWidget {
  final String text;
  final String actionText;
  final VoidCallback onTap;
  final TextAlign textAlign;

  const AppRichText({
    super.key,
    required this.text,
    required this.actionText,
    required this.onTap,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        text: text,
        style: AppTextStyle.bodySmall.copyWith(
          color: AppColor.white.withValues(alpha: 0.75),
        ),
        children: [
          TextSpan(
            text: actionText,
            style: AppTextStyle.bodySmall.copyWith(
              color: AppColor.primary,
              fontWeight: FontWeight.w700,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
