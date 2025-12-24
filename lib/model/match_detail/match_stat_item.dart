class MatchStatItem {
  final String title;
  final String key;
  final String type;
  final String? format;
  final dynamic home;
  final dynamic away;
  final String highlighted;

  MatchStatItem({
    required this.title,
    required this.key,
    required this.type,
    this.format,
    required this.home,
    required this.away,
    required this.highlighted,
  });

  factory MatchStatItem.fromJson(Map<String, dynamic> json) {
    final List stats = json['stats'] ?? [];

    return MatchStatItem(
      title: json['title'] ?? '',
      key: json['key'] ?? '',
      type: json['type'] ?? 'text',
      format: json['format'],
      home: stats.isNotEmpty ? stats[0] : null,
      away: stats.length > 1 ? stats[1] : null,
      highlighted: json['highlighted'] ?? 'equal',
    );
  }
}
