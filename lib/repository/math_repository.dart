import 'package:flutter/material.dart';
import 'package:goalnow_app/model/match/match.dart';
import 'package:goalnow_app/service/api/match_service.dart';

class MatchRepository {
  final MatchService _service;

  MatchRepository(this._service);

  /// MATCHES BY DATE
  Future<List<MatchModel>> getMatchesByDate(String date) {
    debugPrint('Fetching matches for date: $date');
    return _service.getMatchesByDate(date);
  }
}
