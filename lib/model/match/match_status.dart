class MatchStatusModel {
  final bool finished;
  final bool started;
  final String score;
  final String shortReason;
  final DateTime utcTime;

  MatchStatusModel({
    required this.finished,
    required this.started,
    required this.score,
    required this.shortReason,
    required this.utcTime,
  });

  factory MatchStatusModel.fromJson(Map<String, dynamic> json) {
    return MatchStatusModel(
      finished: json['finished'] ?? false,
      started: json['started'] ?? false,
      score: json['scoreStr'] ?? '',
      shortReason: json['reason']?['short'] ?? '',
      utcTime: DateTime.parse(json['utcTime']),
    );
  }
}
