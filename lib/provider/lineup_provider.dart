import 'package:flutter/material.dart';
import 'package:goalnow_app/model/lineup/team_lineup.dart';
import 'package:goalnow_app/model/lineup/lineup_player.dart';
import 'package:goalnow_app/repository/lineup_repository.dart';

enum LineupSide { home, away }

class LineupProvider extends ChangeNotifier {
  final LineupRepository repository;

  LineupProvider(this.repository);

  bool loading = false;
  String? error;

  TeamLineup? home;
  TeamLineup? away;

  LineupSide currentSide = LineupSide.home;

  Future<void> load(int eventId) async {
    loading = true;
    error = null;
    notifyListeners();

    try {
      // HOME
      home = await repository.fetchHomeLineup(eventId);

      // AWAY (có thể null)
      final rawAway = await repository.fetchAwayLineup(eventId);

      if (rawAway != null) {
        away = rawAway.copyWith(
          starters: rawAway.starters
              .map(_mirrorPlayer)
              .toList(),
        );
      } else {
        away = null;
      }
    } catch (e) {
      error = e.toString();
    }

    loading = false;
    notifyListeners();
  }

  void switchSide(LineupSide side) {
    currentSide = side;
    notifyListeners();
  }

  TeamLineup? get currentLineup {
    return currentSide == LineupSide.home ? home : away;
  }

  // =========================
  // Mirror vertical layout for AWAY
  // =========================
  LineupPlayer _mirrorPlayer(LineupPlayer p) {
    final v = p.verticalLayout;

    return p.copyWith(
      verticalLayout: v.copyWith(
        y: 1 - v.y,
      ),
    );
  }
}
