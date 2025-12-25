import 'package:flutter/cupertino.dart';
import 'package:goalnow_app/model/lineup/team_lineup.dart';
import 'package:goalnow_app/service/api/lineup_service.dart';

class LineupRepository {
  final LineupService service;

  LineupRepository(this.service);

  /// HOME TEAM LINEUP
  Future<TeamLineup?> fetchHomeLineup(int eventId) async {
    final json = await service.getHomeLineup(eventId);
    if (json == null) return null;
    debugPrint('Home Lineup JSON: $json');
    debugPrint('Home Lineup JSON Players: ${json['players']}');
    return TeamLineup.fromJson(json);
  }

  /// AWAY TEAM LINEUP
  Future<TeamLineup?> fetchAwayLineup(int eventId) async {
    final json = await service.getAwayLineup(eventId);
    if (json == null) return null;
    debugPrint('Away Lineup JSON: $json');
    debugPrint('Away Lineup JSON Players: ${json['players']}');
    return TeamLineup.fromJson(json);
  }
}
