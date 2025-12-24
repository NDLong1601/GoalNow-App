import 'package:flutter/material.dart';
import 'package:goalnow_app/model/match_detail/match_section.dart';
import 'package:goalnow_app/repository/match_stats_repository.dart';

class MatchStatsProvider extends ChangeNotifier {
  final MatchStatsRepository repository;

  MatchStatsProvider(this.repository);

  bool loading = false;
  String? error;
  List<MatchStatSection> sections = [];

  Future<void> fetchStats(int matchId) async {
    loading = true;
    error = null;
    notifyListeners();

    try {
      sections = await repository.getStats(matchId);
    } catch (e) {
      error = e.toString();
    }

    loading = false;
    notifyListeners();
  }
}
