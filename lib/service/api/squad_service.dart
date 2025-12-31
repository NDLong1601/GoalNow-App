import 'package:goalnow_app/core/network/api_client.dart';
import 'package:goalnow_app/core/network/api_endpoint.dart';

class SquadService {
  final ApiClient _client;

  SquadService(this._client);

  Future<Map<String, dynamic>> getSquad({required int teamId}) {
    return _client.get(
      ApiEndpoint.teamSquad,
      query: {'teamid': teamId.toString()},
    );
  }
}
