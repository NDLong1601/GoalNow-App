import 'package:flutter/material.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/core/enum/enum.dart';
import 'package:goalnow_app/core/extension/context_extension.dart';

class AppButton extends StatelessWidget {
  /// Text
  final String? text;

  final VoidCallback? onPressed;
  final AppButtonType type;

  /// Icon support
  final IconData? icon;
  final String? iconAssetPath;
  final double iconSize;
  final bool tintIcon;

  /// Asset prefix/suffix for normal button
  final String? prefixIconPath;
  final String? suffixIconPath;

  /// Size
  final double? height;
  final double? width;

  /// Shape & border
  final double radius;
  final double borderWidth;
  final bool isCircle;

  /// Padding override
  final EdgeInsetsGeometry? padding;

  /// Color override 
  final Color? backgroundColorOverride;
  final Color? borderColorOverride;
  final Color? textColorOverride;

  const AppButton({
    super.key,
    this.text,
    required this.type,
    this.onPressed,

    // icon
    this.icon,
    this.iconAssetPath,
    this.iconSize = 20,
    this.tintIcon = false,

    // asset prefix/suffix
    this.prefixIconPath,
    this.suffixIconPath,

    // size
    this.height,
    this.width,

    // shape
    this.radius = 12,
    this.borderWidth = 1,
    this.isCircle = false,

    // padding
    this.padding,

    // overrides
    this.backgroundColorOverride,
    this.borderColorOverride,
    this.textColorOverride,
  });

  @override
  Widget build(BuildContext context) {
    final disabledColor = context.theme.disabledColor;

    final _ButtonStyle baseStyle = _resolveStyle(
      type: type,
      disabled: disabledColor,
    );

    final bool isDisabled = type == AppButtonType.disabled;

    final Color bgColor =
        backgroundColorOverride ?? baseStyle.backgroundColor;
    final Color brColor =
        borderColorOverride ?? baseStyle.borderColor;
    final Color txtColor =
        textColorOverride ?? baseStyle.textColor;

    final OutlinedBorder shape = isCircle
        ? const CircleBorder()
        : RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          );

    return SizedBox(
      height: height ?? 52 / 812 * context.sh,
      width: width ?? 343 / 375 * context.sw,
      child: OutlinedButton(
        onPressed: isDisabled ? null : onPressed,
        style: OutlinedButton.styleFrom(
          elevation: 0,
          backgroundColor: bgColor,
          side: BorderSide(color: brColor, width: borderWidth),
          shape: shape,
          padding: padding ??
              (isCircle
                  ? EdgeInsets.zero
                  : const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 14,
                    )),
          disabledBackgroundColor: bgColor,
          disabledForegroundColor: txtColor,
        ),
        child: _buildContent(txtColor),
      ),
    );
  }

  Widget _buildContent(Color textColor) {
    final bool hasText = text != null && text!.trim().isNotEmpty;

    // Icon-only / social button
    if (!hasText && (icon != null || iconAssetPath != null)) {
      return _buildIcon(textColor);
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (prefixIconPath != null) ...[
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Image.asset(
              prefixIconPath!,
              width: 20,
              height: 20,
              color: textColor,
            ),
          ),
        ],

        Text(
          text ?? '',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),

        if (suffixIconPath != null) ...[
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Image.asset(
              suffixIconPath!,
              width: 20,
              height: 20,
              color: textColor,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildIcon(Color color) {
    // Asset icon (AppAssetsPath)
    if (iconAssetPath != null) {
      return Image.asset(
        iconAssetPath!,
        width: iconSize,
        height: iconSize,
        color: tintIcon ? color : null,
      );
    }

    // Material icon
    if (icon != null) {
      return Icon(
        icon,
        size: iconSize,
        color: color,
      );
    }

    return const SizedBox.shrink();
  }
}

class _ButtonStyle {
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  const _ButtonStyle({
    required this.backgroundColor,
    required this.textColor,
    required this.borderColor,
  });
}

_ButtonStyle _resolveStyle({
  required AppButtonType type,
  required Color disabled,
}) {
  switch (type) {
    case AppButtonType.primary:
      return const _ButtonStyle(
        backgroundColor: AppColor.primary,
        textColor: AppColor.background,
        borderColor: Colors.transparent,
      );

    case AppButtonType.secondary:
      return const _ButtonStyle(
        backgroundColor: Colors.transparent,
        textColor: AppColor.primary,
        borderColor: AppColor.primary,
      );

    case AppButtonType.danger:
      return const _ButtonStyle(
        backgroundColor: Color(0xFFFF3B30),
        textColor: Colors.white,
        borderColor: Colors.transparent,
      );

    case AppButtonType.social:
      return const _ButtonStyle(
        backgroundColor: AppColor.surface,
        textColor: Colors.white,
        borderColor: Colors.transparent,
      );

    case AppButtonType.disabled:
      return _ButtonStyle(
        backgroundColor: disabled.withValues(alpha: 0.15),
        textColor: disabled,
        borderColor: Colors.transparent,
      );
  }
}
