import 'package:flutter/material.dart';
import 'package:goalnow_app/core/network/api_client.dart';
import 'package:goalnow_app/core/network/api_endpoint.dart';
import 'package:goalnow_app/model/transfer/transfer.dart';

class TransferService {
  final ApiClient _client;

  TransferService(this._client);

  // ALL TRANSFERS
  Future<List<TransferModel>> getAllTransfers() async {
    final data = await _client.get(ApiEndpoint.allTransfers);

    debugPrint('TRANSFER RAW RESPONSE: $data');
    final list = (data['response']?['transfers'] as List?) ?? [];

    debugPrint('TRANSFER LIST LENGTH: ${list.length}');

    return list
        .whereType<Map>()
        .map((e) => TransferModel.fromJson(e.cast<String, dynamic>()))
        .toList();
  }
}
