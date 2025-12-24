class MatchTeamModel {
  final int id;
  final String name;
  final String longName;
  final int score;
  final int? redCards;

  MatchTeamModel({
    required this.id,
    required this.name,
    required this.longName,
    required this.score,
    this.redCards,
  });

  factory MatchTeamModel.fromJson(Map<String, dynamic> json) {
    return MatchTeamModel(
      id: json['id'],
      name: json['name'],
      longName: json['longName'],
      score: json['score'] ?? 0,
      redCards: json['redCards'],
    );
  }
}
