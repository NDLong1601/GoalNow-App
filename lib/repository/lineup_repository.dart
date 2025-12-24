import 'package:goalnow_app/model/lineup/team_lineup.dart';
import 'package:goalnow_app/service/lineup_service.dart';

class LineupRepository {
  final LineupService service;

  LineupRepository(this.service);

  Future<TeamLineup?> fetchHomeLineup(int eventId) async {
    final json = await service.getHomeLineup(eventId);
    if (json == null) return null;
    return TeamLineup.fromJson(json);
  }

  Future<TeamLineup?> fetchAwayLineup(int eventId) async {
    final json = await service.getAwayLineup(eventId);
    if (json == null) return null;
    return TeamLineup.fromJson(json);
  }
}
