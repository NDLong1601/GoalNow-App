import 'package:flutter/material.dart';
import 'package:goalnow_app/model/match/match.dart';
import 'package:goalnow_app/repository/math_repository.dart';

class MatchProvider extends ChangeNotifier {
  final MatchRepository _repository;

  MatchProvider(this._repository);

  /// State
  bool loading = false;
  String? error;
  List<MatchModel> matches = [];

  /// Fetch matches by date
  Future<void> fetchMatches(String date) async {
    loading = true;
    error = null;
    notifyListeners();

    try {
      // Fetch matches by date
      matches = await _repository.getMatchesByDate(date);
      debugPrint('Fetched ${matches.length} matches for date $date');
    } catch (e) {
      error = e.toString();
      debugPrint('Error fetching matches: $error');
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
