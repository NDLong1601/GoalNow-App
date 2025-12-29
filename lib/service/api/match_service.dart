import 'package:flutter/material.dart';
import 'package:goalnow_app/core/network/api_client.dart';
import 'package:goalnow_app/core/network/api_endpoint.dart';
import 'package:goalnow_app/model/match/match.dart';

class MatchService {
  final ApiClient _client;

  MatchService(this._client);

  /// MATCHES BY DATE
  Future<List<MatchModel>> getMatchesByDate(String date) async {
    final data = await _client.get(
      ApiEndpoint.matchesByDate,
      query: {'date': date},
    );
    debugPrint('Matches By Date Response: $data');
    final List list = data['response']['matches'];

    return list.map((e) => MatchModel.fromJson(e)).toList();
  }
}
