import 'package:goalnow_app/model/match_status.dart';
import 'package:goalnow_app/model/match_team.dart';

class MatchModel {
  final int id;
  final int leagueId;
  final DateTime time;
  final MatchTeamModel home;
  final MatchTeamModel away;
  final MatchStatusModel status;

  MatchModel({
    required this.id,
    required this.leagueId,
    required this.time,
    required this.home,
    required this.away,
    required this.status,
  });

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    return MatchModel(
      id: json['id'],
      leagueId: json['leagueId'],
      time: DateTime.parse(json['status']['utcTime']),
      home: MatchTeamModel.fromJson(json['home']),
      away: MatchTeamModel.fromJson(json['away']),
      status: MatchStatusModel.fromJson(json['status']),
    );
  }
}
