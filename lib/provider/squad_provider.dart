import 'package:flutter/material.dart';
import 'package:goalnow_app/model/player/player_squad.dart';
import 'package:goalnow_app/repository/squad_repository.dart';

class SquadProvider extends ChangeNotifier {
  final SquadRepository repository;

  SquadProvider(this.repository);

  bool loading = false;
  Map<String, List<SquadPlayerModel>> squad = {};

  Future<void> fetch(int teamId) async {
    loading = true;
    notifyListeners();

    try {
      squad = await repository.getSquad(teamId);
    } catch (e) {
      debugPrint(e.toString());
    }

    loading = false;
    notifyListeners();
  }
}
