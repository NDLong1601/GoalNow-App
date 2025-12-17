import 'package:flutter/material.dart';
import 'package:goalnow_app/core/const/app_color.dart';

class AppTextStyle {
  AppTextStyle._();

  static const String _font = 'Poppins';

  static const TextStyle display = TextStyle(
    fontFamily: _font,
    fontSize: 30,
    height: 34 / 30,
    fontWeight: FontWeight.w800,
    letterSpacing: 0.1,
    color: AppColor.textPrimary,
  );

  /// Headings
  static const TextStyle h1 = TextStyle(
    fontFamily: _font,
    fontSize: 22,
    height: 26 / 22,
    fontWeight: FontWeight.w700,
    color: AppColor.textPrimary,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: _font,
    fontSize: 18,
    height: 22 / 18,
    fontWeight: FontWeight.w600,
    color: AppColor.textPrimary,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: _font,
    fontSize: 16,
    height: 20 / 16,
    fontWeight: FontWeight.w600,
    color: AppColor.textPrimary,
  );

  /// Body text
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: _font,
    fontSize: 15,
    height: 20 / 15,
    fontWeight: FontWeight.w500,
    color: AppColor.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontFamily: _font,
    fontSize: 14,
    height: 18 / 14,
    fontWeight: FontWeight.w400,
    color: AppColor.textPrimary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: _font,
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.2,
    color: AppColor.textSecondary,
  );

  /// Micro typography
  static const TextStyle caption = TextStyle(
    fontFamily: _font,
    fontSize: 11,
    height: 14 / 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.2,
    color: AppColor.textSecondary,
  );

  static const TextStyle overline = TextStyle(
    fontFamily: _font,
    fontSize: 10,
    height: 12 / 10,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
    color: AppColor.textSecondary,
  );

  /// Buttons / CTAs

  static const TextStyle buttonPrimary = TextStyle(
    fontFamily: _font,
    fontSize: 16,
    height: 20 / 16,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.3,
    color: AppColor.textPrimary,
  );

  static const TextStyle buttonSecondary = TextStyle(
    fontFamily: _font,
    fontSize: 14,
    height: 18 / 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
    color: AppColor.textPrimary,
  );

  /// Scores & Live

  static const TextStyle score = TextStyle(
    fontFamily: _font,
    fontSize: 28,
    height: 32 / 28,
    fontWeight: FontWeight.w800,
    color: AppColor.textPrimary,
  );

  static const TextStyle scoreSmall = TextStyle(
    fontFamily: _font,
    fontSize: 15,
    height: 20 / 15,
    fontWeight: FontWeight.w600,
    color: AppColor.textPrimary,
  );

  /// Navigation
  static const TextStyle bottomNav = TextStyle(
    fontFamily: _font,
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
    color: AppColor.textSecondary,
  );

  static const TextStyle appBarTitle = TextStyle(
    fontFamily: _font,
    fontSize: 18,
    height: 20 / 18,
    fontWeight: FontWeight.w600,
    color: AppColor.textPrimary,
  );

  /// Inputs

  static const TextStyle input = TextStyle(
    fontFamily: _font,
    fontSize: 15,
    height: 20 / 15,
    fontWeight: FontWeight.w400,
    color: AppColor.textPrimary,
  );

  static const TextStyle placeholder = TextStyle(
    fontFamily: _font,
    fontSize: 15,
    height: 20 / 15,
    fontWeight: FontWeight.w400,
    color: AppColor.textMuted,
  );

  static const TextStyle error = TextStyle(
    fontFamily: _font,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColor.live,
  );

  /// Cards & Lists

  static const TextStyle cardTitle = TextStyle(
    fontFamily: _font,
    fontSize: 16,
    height: 20 / 16,
    fontWeight: FontWeight.w600,
    color: AppColor.textPrimary,
  );

  static const TextStyle cardSubtitle = TextStyle(
    fontFamily: _font,
    fontSize: 13,
    height: 16 / 13,
    fontWeight: FontWeight.w500,
    color: AppColor.textSecondary,
  );

  /// Empty state

  static const TextStyle emptyTitle = TextStyle(
    fontFamily: _font,
    fontSize: 18,
    height: 22 / 18,
    fontWeight: FontWeight.w600,
    color: AppColor.textPrimary,
  );

  static const TextStyle emptyDescription = TextStyle(
    fontFamily: _font,
    fontSize: 14,
    height: 18 / 14,
    fontWeight: FontWeight.w400,
    color: AppColor.textSecondary,
  );

  static const TextStyle primaryText = TextStyle(
    fontFamily: _font,
    fontSize: 14,
    height: 18 / 14,
    fontWeight: FontWeight.w400,
    color: AppColor.primary,
  );

  static const TextStyle boldTs14Primary = TextStyle(
    fontFamily: _font,
    fontSize: 14,
    height: 18 / 14,
    fontWeight: FontWeight.w600,
    color: AppColor.primary,
  );

    static const TextStyle boldTs14White = TextStyle(
    fontFamily: _font,
    fontSize: 14,
    height: 18 / 14,
    fontWeight: FontWeight.w600,
    color: AppColor.white,
  );
}
