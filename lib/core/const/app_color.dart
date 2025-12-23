import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  /// Primary background (Dark)
  static const Color background = Color(0xFF0B0F12);

  /// Surface / Card background
  static const Color surface = Color(0xFF0F1417);

  /// Elevated surface / Modal
  static const Color surfaceElevated = Color(0xFF14181B);

  /// Primary text (high contrast)
  static const Color textPrimary = Color(0xFFE6F0EA);

  /// Secondary text
  static const Color textSecondary = Color(0xFFAAB7B0);

  /// Muted text / Placeholder
  static const Color textMuted = Color(0xFF6E7A75);

  /// Football green (primary accent)
  static const Color primary = Color(0xFF23C06B);

  /// Darker accent (buttons, gradients)
  static const Color primaryDark = Color(0xFF18A955);

  /// Soft green glow / highlight
  static const Color primaryGlow = Color.fromRGBO(35, 192, 107, 0.12);

  /// Live indicator / Alert
  static const Color live = Color(0xFFFF3B30);

  /// Success / Positive state
  static const Color success = Color(0xFF2ED47A);

  /// Featured / Hot badge
  static const Color featured = Color(0xFFFFD166);

  /// Divider / Subtle border
  static const Color divider = Color(0xFF1C2426);

  /// Icons (default)
  static const Color iconPrimary = textPrimary;

  /// Icons secondary / disabled
  static const Color iconSecondary = textMuted;

  static const Color white = Colors.white;
}
