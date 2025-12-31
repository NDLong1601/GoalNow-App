import 'package:goalnow_app/core/enum/enum.dart';
import 'package:goalnow_app/core/network/api_client.dart';
import 'package:goalnow_app/core/utils/top_player_helper.dart';

class TopPlayerService {
  final ApiClient _client;
  TopPlayerService(this._client);

  Future<Map<String, dynamic>> getTopPlayers({
    required TopPlayerTab tab,
    required int leagueId,
  }) {
    return _client.get(tab.endpoint, query: {'leagueid': leagueId.toString()});
  }
}
