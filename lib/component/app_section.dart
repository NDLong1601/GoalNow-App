import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';

class AppSectionTitle extends StatelessWidget {
  final String title;

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  /// Right side
  final bool showAction;
  final String actionText;
  final Widget? actionIcon;
  final VoidCallback? onAction;
  final String? routeName;

  final Widget? trailing;

  const AppSectionTitle({
    super.key,
    required this.title,
    this.padding,
    this.margin,
    this.showAction = false,
    this.actionText = 'More',
    this.actionIcon,
    this.onAction,
    this.routeName,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    void handleTap() {
      if (routeName != null) {
        Navigator.pushNamed(context, routeName!);
        return;
      }
      onAction?.call();
    }

    return Container(
      margin: margin,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: title,
            style: AppTextstyle.semiboldTs16Black,
            textAlign: TextAlign.start,
          ),

          if (trailing != null)
            trailing!
          else if (showAction)
            GestureDetector(
              onTap: (routeName != null || onAction != null) ? handleTap : null,
              child: Row(
                children: [
                  if (actionIcon != null) ...[actionIcon!, SizedBox(width: 6)],
                  AppText(
                    text: actionText,
                    style: AppTextstyle.boldTs16Primary,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
