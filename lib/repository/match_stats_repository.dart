import 'package:goalnow_app/model/match_detail/match_section.dart';
import 'package:goalnow_app/service/stats_service.dart';

class MatchStatsRepository {
  final MatchStatsService service;

  MatchStatsRepository(this.service);

  Future<List<MatchStatSection>> getStats(int matchId) async {
    return await service.getMatchStats(matchId);
  }
}
