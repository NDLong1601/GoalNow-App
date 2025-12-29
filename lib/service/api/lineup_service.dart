import 'package:flutter/foundation.dart';
import 'package:goalnow_app/core/network/api_client.dart';
import 'package:goalnow_app/core/network/api_endpoint.dart';

class LineupService {
  final ApiClient _client;

  LineupService(this._client);

  /// HOME TEAM LINEUP
  Future<Map<String, dynamic>?> getHomeLineup(int eventId) async {
    final respone = await _client.get(
      ApiEndpoint.homeTeamLineup,
      query: {'eventid': eventId.toString()},
    );
    debugPrint('Home Lineup Response: $respone');
    return respone['response']?['lineup'];
  }

  /// AWAY TEAM LINEUP
  Future<Map<String, dynamic>?> getAwayLineup(int eventId) async {
    final respone = await _client.get(
      ApiEndpoint.awayTeamLineup,
      query: {'eventid': eventId.toString()},
    );
    debugPrint('Away Lineup Response: $respone');
    return respone['response']?['lineup'];
  }
}
