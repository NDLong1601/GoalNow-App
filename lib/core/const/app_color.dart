import 'package:flutter/material.dart';

///Primary Background (Dark): #0B0F12 — nền chính của app
// Surface / Card Background: #0F1417 — nền thẻ, panel, cards (nhẹ hơn background để tạo phân lớp)
// Elevated Surface / Modal: #14181B — nền cho modal/overlay hoặc bar nổi
// Primary Text (High contrast): #E6F0EA — chữ chính, tiêu đề (sáng, dễ đọc trên nền tối)
// Secondary Text: #AAB7B0 — chữ phụ, mô tả, timestamp
// Muted Text / Placeholder: #6E7A75 — placeholder, nhãn kém quan trọng
// Accent (Football Green): #23C06B — màu chủ đạo cho CTA, highlight, các trạng thái tích cực
// Accent Dark (for buttons/gradients): #18A955 — biến thể tối hơn của xanh để tạo chiều sâu
// Live Indicator / Alert: #FF3B30 — màu đỏ nổi bật cho trạng thái trận đấu đang diễn ra hoặc cảnh báo
// Progress / Highlights Glow: rgba(35, 192, 107, 0.12) — xanh nhạt bán trong suốt cho glow/selection (nêu dưới dạng rgba)
// Divider / Subtle Border: #1C2426 — đường phân cách mảnh trên nền tối
// Icon / Accent Secondary (gold-ish for featured): #FFD166 — dùng tiết chế cho huy hiệu “hot” hoặc nổi bật tùy chọn
// Success / Positive chip (alternative): #2ED47A — màu cho trạng thái thành công/tích cực nhỏ

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
