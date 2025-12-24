import 'package:flutter/material.dart';
import 'package:goalnow_app/model/match/match.dart';
import 'package:goalnow_app/repository/math_repository.dart';

class MatchProvider extends ChangeNotifier {
  final MatchRepository _repository;

  MatchProvider(this._repository);

  bool loading = false;
  String? error;
  List<MatchModel> matches = [];

  Future<void> fetchMatches(String date) async {
    loading = true;
    error = null;
    notifyListeners();

    try {
      matches = await _repository.getMatchesByDate(date);
    } catch (e) {
      error = e.toString();
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
