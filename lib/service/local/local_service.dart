import 'package:flutter/material.dart';
import 'package:goalnow_app/model/player/top_player_local_model.dart';
import 'package:goalnow_app/model/transfer/transfer_local_model.dart';
import 'package:hive/hive.dart';

class LocalService {
  static const String _transferBoxName = 'transfersBox';
  static const String _topPlayerBoxName = 'topPlayerBox';

  late Box<TransferLocalModel> _transferBox;
  late Box<TopPlayerLocalModel> _topPlayerBox;

  // INIT LOCAL SERVICE
  Future<void> init() async {
    debugPrint('INITIALIZING LOCAL SERVICE...');
    _transferBox = await Hive.openBox<TransferLocalModel>(_transferBoxName);
    _topPlayerBox = await Hive.openBox<TopPlayerLocalModel>(_topPlayerBoxName);
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

  /// ===== TOP PLAYERS =====
  Future<void> saveTopPlayers({
    required int leagueId,
    required String tab, // 'goal' | 'assist'
    required TopPlayerLocalModel data,
  }) async {
    final key = '$leagueId-$tab';
    await _topPlayerBox.put(key, data);
    debugPrint('SAVED TOP PLAYERS $key TO LOCAL STORAGE');
  }

  TopPlayerLocalModel? getTopPlayers({
    required int leagueId,
    required String tab,
  }) {
    final key = '$leagueId-$tab';
    return _topPlayerBox.get(key);
  }

  bool hasTopPlayers({required int leagueId, required String tab}) {
    final key = '$leagueId-$tab';
    return _topPlayerBox.containsKey(key);
  }

  Future<void> clearTopPlayers() async {
    await _topPlayerBox.clear();
  }
}
