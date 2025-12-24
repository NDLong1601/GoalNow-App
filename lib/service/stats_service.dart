import 'package:goalnow_app/core/network/api_client.dart';
import 'package:goalnow_app/core/network/api_endpoint.dart';
import 'package:goalnow_app/model/match_detail/match_section.dart';

class MatchStatsService {
  final ApiClient _client;

  MatchStatsService(this._client);

  Future<List<MatchStatSection>> getMatchStats(int matchId) async {
    final data = await _client.get(
      ApiEndpoint.matchStats,
      query: {'eventid': matchId.toString()},
    );

    final List list = data['response']['stats'];

    return list
        .map((e) => MatchStatSection.fromJson(e))
        .toList();
  }
}
