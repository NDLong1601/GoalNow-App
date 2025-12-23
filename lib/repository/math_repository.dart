import 'package:goalnow_app/model/match.dart';
import 'package:goalnow_app/service/match_service.dart';

class MatchRepository {
  final MatchService _service;

  MatchRepository(this._service);

  Future<List<MatchModel>> getMatchesByDate(String date) {
    return _service.getMatchesByDate(date);
  }
}
