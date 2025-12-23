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

  // Format date api
  static String apiDate(DateTime date) {
    return '${date.year}'
        '${date.month.toString().padLeft(2, '0')}'
        '${date.day.toString().padLeft(2, '0')}';
  }
}
