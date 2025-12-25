import 'package:flutter/material.dart';
import 'package:goalnow_app/model/transfer/transfer.dart';
import 'package:goalnow_app/model/transfer/transfer_mapper.dart';
import 'package:goalnow_app/service/api/transfer_service.dart';
import 'package:goalnow_app/service/local/local_service.dart';

class TransferRepository {
  final TransferService _remote;
  final LocalService _local;

  TransferRepository(this._remote, this._local);

  /// Get ALL TRANSFERS
  Future<List<TransferModel>> getAllTransfers() async {
    try {
      // Try remote
      final remoteData = await _remote.getAllTransfers();
      debugPrint('Fetched ${remoteData.length} transfers from remote');
      // Save to local
      await _local.saveTransfers(
        remoteData.map(TransferMapper.toLocal).toList(),
      );
      debugPrint('Saved transfers to local storage');

      return remoteData;
    } catch (e, stackTrace) {
      // Offline fallback
      if (_local.hasTransfers()) {
        return _local.getAllTransfers().map(TransferMapper.fromLocal).toList();
      }
      debugPrint('Error fetching transfers: $e');
      debugPrintStack(stackTrace: stackTrace);
      rethrow;
    }
  }
}
