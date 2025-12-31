import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:goalnow_app/core/enum/enum.dart';
import 'package:goalnow_app/model/player/top_player_local_model.dart';
import 'package:goalnow_app/model/player/top_stat_player.dart';
import 'package:goalnow_app/repository/top_player_repository.dart';
import 'package:goalnow_app/service/local/local_service.dart';

class TopPlayerProvider extends ChangeNotifier {
  final TopPlayerRepository repository;
  final LocalService localService;

  TopPlayerProvider(
    this.repository,
    this.localService,
  );

  // ===== CONFIG =====
  static const Duration cacheTTL = Duration(minutes: 30);

  // ===== STATE =====
  int leagueId = 47;
  TopPlayerTab currentTab = TopPlayerTab.goal;

  final Map<TopPlayerTab, bool> loading = {
    TopPlayerTab.goal: false,
    TopPlayerTab.assist: false,
  };

  final Map<TopPlayerTab, List<TopStatPlayerModel>> data = {
    TopPlayerTab.goal: <TopStatPlayerModel>[],
    TopPlayerTab.assist: <TopStatPlayerModel>[],
  };

  List<TopStatPlayerModel> get currentList => data[currentTab] ?? const [];
  bool get isLoading => loading[currentTab] ?? false;

  // ===== INIT =====
  Future<void> init() async {
    await _loadFromLocal(currentTab);
    await fetch(currentTab);
  }

  // ===== TAB =====
  Future<void> switchTab(TopPlayerTab tab) async {
    if (currentTab == tab) return;
    currentTab = tab;
    notifyListeners();

    if ((data[tab] ?? []).isEmpty) {
      await _loadFromLocal(tab);
      await fetch(tab);
    }
  }

  // ===== LEAGUE =====
  Future<void> changeLeague(int id) async {
    if (leagueId == id) return;
    leagueId = id;

    data[TopPlayerTab.goal] = [];
    data[TopPlayerTab.assist] = [];
    notifyListeners();

    await _loadFromLocal(currentTab);
    await fetch(currentTab);
  }

  // ===== FETCH =====
  Future<void> fetch(TopPlayerTab tab) async {
    loading[tab] = true;
    notifyListeners();

    try {
      final list = await repository.getTopPlayers(
        tab: tab,
        leagueId: leagueId,
      );

      data[tab] = list;

      /// SAVE CACHE
      await localService.saveTopPlayers(
        leagueId: leagueId,
        tab: tab.name,
        data: TopPlayerLocalModel(
          leagueId: leagueId,
          tab: tab.name,
          rawJson: jsonEncode(list.map((e) => e.toJson()).toList()),
          savedAt: DateTime.now().millisecondsSinceEpoch,
        ),
      );
    } catch (e) {
      debugPrint('FETCH ERROR → $e');
    }

    loading[tab] = false;
    notifyListeners();
  }

  // ===== LOCAL =====
  Future<void> _loadFromLocal(TopPlayerTab tab) async {
    final cache = localService.getTopPlayers(
      leagueId: leagueId,
      tab: tab.name,
    );

    if (cache == null) return;
    if (cache.isExpired(cacheTTL)) return;

    try {
      final decoded = jsonDecode(cache.rawJson) as List;
      data[tab] = decoded
          .map((e) => TopStatPlayerModel.fromJson(e))
          .toList();
      notifyListeners();
    } catch (e) {
      debugPrint('CACHE PARSE ERROR → $e');
    }
  }
}
