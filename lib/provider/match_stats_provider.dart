import 'package:flutter/material.dart';
import 'package:goalnow_app/model/match_detail/match_section.dart';
import 'package:goalnow_app/repository/match_stats_repository.dart';

class MatchStatsProvider extends ChangeNotifier {
  final MatchStatsRepository repository;

  MatchStatsProvider(this.repository);
  /// State
  bool loading = false;
  String? error;
  List<MatchStatSection> sections = [];

  /// Fetch match statistics
  Future<void> fetchStats(int matchId) async {
    loading = true;
    error = null;
    notifyListeners();

    try {
      debugPrint('Fetching stats for match ID: $matchId');
      sections = await repository.getStats(matchId);

    } catch (e) {
      error = e.toString();
      debugPrint('Error fetching match stats: $error');
    }

    loading = false;
    notifyListeners();
  }
}
