import 'package:flutter/material.dart';
import 'package:goalnow_app/model/match_detail/match_section.dart';
import 'package:goalnow_app/service/api/stats_service.dart';

class MatchStatsRepository {
  final MatchStatsService service;

  MatchStatsRepository(this.service);

  /// MATCH STATS
  Future<List<MatchStatSection>> getStats(int matchId) async {
    debugPrint('Fetching match stats for match ID: $matchId');
    debugPrint('Using MatchStatsService: $service');
    return await service.getMatchStats(matchId);
  }
}
