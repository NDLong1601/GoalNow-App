import 'match_stat_item.dart';

class MatchStatSection {
  final String title;
  final String key;
  final List<MatchStatItem> items;

  MatchStatSection({
    required this.title,
    required this.key,
    required this.items,
  });

  factory MatchStatSection.fromJson(Map<String, dynamic> json) {
    return MatchStatSection(
      title: json['title'] ?? '',
      key: json['key'] ?? '',
      items: (json['stats'] as List? ?? [])
          .map((e) => MatchStatItem.fromJson(e))
          .toList(),
    );
  }
}
