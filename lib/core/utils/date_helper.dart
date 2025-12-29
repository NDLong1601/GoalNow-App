import 'package:intl/intl.dart';

class DateHelper {

  /// Nhóm nhãn ngày
  static String groupLabel(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final target = DateTime(date.year, date.month, date.day);

    final diff = target.difference(today).inDays;

    if (diff == 0) return 'Today';
    if (diff == 1) return 'Tomorrow';

    return '${date.day}/${date.month}/${date.year}';
  }

  /// Lấy phần thời gian (HH:mm) từ DateTime
  static String timeOnly(DateTime date) {
    final h = date.hour.toString().padLeft(2, '0');
    final m = date.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }


  /// Format contract range: 01 Jan 2026 → 31 Dec 2026
  static String formatRange(DateTime? from, DateTime? to) {
    final fromText = formatDateTime(from);
    final toText = formatDateTime(to);

    if (fromText == '-' && toText == '-') {
      return '-';
    }
    return '$fromText → $toText';
  }

  /// Format date and time: 01 Jan 2026, 14:30
  /// - Nếu date không hợp lệ → trả về '-'
  static String formatDateTime(DateTime? date) {
    if (date == null) return '-';

    // Trường hợp date mặc định (1970-01-01)
    if (date.millisecondsSinceEpoch <= 0) {
      return '-';
    }

    try {
      return DateFormat('dd MMM yyyy, HH:mm').format(date);
    } catch (_) {
      return '-';
    }
  }
}
