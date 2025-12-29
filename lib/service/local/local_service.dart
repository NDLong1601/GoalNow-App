import 'package:flutter/material.dart';
import 'package:goalnow_app/model/transfer/transfer_local_model.dart';
import 'package:hive/hive.dart';

class LocalService {
  static const String _transferBoxName = 'transfersBox';

  late Box<TransferLocalModel> _transferBox;

  // INIT LOCAL SERVICE
  Future<void> init() async {
    debugPrint('INITIALIZING LOCAL SERVICE...');
    _transferBox = await Hive.openBox<TransferLocalModel>(_transferBoxName);
  }

  // Save transfers to local storage
  Future<void> saveTransfers(List<TransferLocalModel> transfers) async {
    await _transferBox.clear();
    await _transferBox.addAll(transfers);
    debugPrint('SAVED ${transfers.length} TRANSFERS TO LOCAL STORAGE');
  }

  // Get all transfers from local storage
  List<TransferLocalModel> getAllTransfers() {
    debugPrint('FETCHED ${_transferBox.length} TRANSFERS FROM LOCAL STORAGE');
    return _transferBox.values.toList();
  }

  // CHECK IF HAS TRANSFERS
  bool hasTransfers() => _transferBox.isNotEmpty;
}
