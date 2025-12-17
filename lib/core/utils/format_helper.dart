String formatEmail(String email) {
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
