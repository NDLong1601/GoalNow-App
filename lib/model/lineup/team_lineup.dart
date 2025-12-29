import 'package:goalnow_app/model/lineup/lineup_player.dart';

class TeamLineup {
  final int id;
  final String name;
  final String formation;
  final double? rating;
  final List<LineupPlayer> starters;

  TeamLineup({
    required this.id,
    required this.name,
    required this.formation,
    required this.starters,
    this.rating,
  });

  factory TeamLineup.fromJson(Map<String, dynamic> json) {
    return TeamLineup(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      formation: json['formation'] ?? '',
      rating: (json['rating'] as num?)?.toDouble(),
      starters:
          (json['starters'] as List?)
              ?.map((e) => LineupPlayer.fromJson(e))
              .toList() ??
          [],
    );
  }

  TeamLineup copyWith({
    int? id,
    String? name,
    String? formation,
    double? rating,
    List<LineupPlayer>? starters,
  }) {
    return TeamLineup(
      id: id ?? this.id,
      name: name ?? this.name,
      formation: formation ?? this.formation,
      rating: rating ?? this.rating,
      starters: starters ?? this.starters,
    );
  }
}
