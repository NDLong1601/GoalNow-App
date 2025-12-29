import 'package:flutter/material.dart';

class FormatHelper {
  // Format Datetime
  static String timeAgo(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);

    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes} minutes ago';
    if (diff.inHours < 24) return '${diff.inHours} hours ago';
    if (diff.inDays < 7) return '${diff.inDays} days ago';

    return '${time.day}/${time.month}/${time.year}';
  }

  // Format email
  static String formatEmail(String email) {
    if (email.isEmpty || !email.contains('@')) {
      return email;
    }

    final parts = email.split('@');
    if (parts.length != 2) return email;

    final localPart = parts[0]; // before @
    final domainPart = parts[1]; // after @

    // ---- Local part: ng**** ----
    final visibleCount = localPart.length >= 2 ? 2 : 1;
    final maskedLocal = '${localPart.substring(0, visibleCount)}****';

    // ---- Domain part: ****.com ----
    final domainSegments = domainPart.split('.');
    final extension = domainSegments.isNotEmpty ? domainSegments.last : '';

    final maskedDomain = extension.isNotEmpty ? '****.$extension' : '****';

    return '$maskedLocal@$maskedDomain';
  }

  /// Format date for API: YYYYMMDD
  static String apiDate(DateTime date) {
    return '${date.year}'
        '${date.month.toString().padLeft(2, '0')}'
        '${date.day.toString().padLeft(2, '0')}';
  }

  /// Format tên cầu thủ cho lineup
  /// VD: "Senne Lammens" -> "Se.Lammens"
  static String formatPlayerName(String fullName, {int firstLetters = 2}) {
    final name = fullName.trim();

    if (name.isEmpty) return '';

    final parts = name.split(RegExp(r'\s+'));

    // Chỉ có 1 từ → giữ nguyên
    if (parts.length == 1) {
      return name;
    }

    final first = parts.first;
    final last = parts.last;

    final prefix = first.length <= firstLetters
        ? first
        : first.substring(0, firstLetters);

    return '$prefix.$last';
  }

  /// Lấy màu theo đánh giá cầu thủ
  static const double _highRatingThreshold = 7.5;
  static const double _mediumRatingThreshold = 6.5;

  static Color ratingColor(double rating) {
    if (rating >= _highRatingThreshold) return const Color(0xFF2ECC71);
    if (rating >= _mediumRatingThreshold) return const Color(0xFFF1C40F);
    return Colors.white.withValues(alpha: 0.55);
  }

  /// Format market value / fee
  /// Examples:
  /// 2300000   -> €2.3M
  /// 450000    -> €450K
  /// 12000000  -> €12M
  /// 0         -> -
  static String formatCurrency(
    num? value, {
    String symbol = '€',
    bool showZero = false,
  }) {
    // Null or zero value
    if (value == null || value <= 0) {
      return showZero ? '${symbol}0' : '-';
    }
    // Billion
    if (value >= 1000000000) {
      return '$symbol${_format(value / 1000000000)}B';
    }
    // Million
    if (value >= 1000000) {
      return '$symbol${_format(value / 1000000)}M';
    }
    // Thousand
    if (value >= 1000) {
      return '$symbol${_format(value / 1000)}K';
    }
    // Less than thousand
    return '$symbol${value.toInt()}';
  }

  static String _format(num v) {
    final s = v.toStringAsFixed(1);
    return s.endsWith('.0') ? s.substring(0, s.length - 2) : s;
  }
}
