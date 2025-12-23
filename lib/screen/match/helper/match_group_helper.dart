import 'package:goalnow_app/core/enum/enum.dart';
import 'package:goalnow_app/core/utils/date_helper.dart';
import 'package:goalnow_app/model/match.dart';

class MatchGroupHelper {
  static List<MatchModel> filterByTab(List<MatchModel> list, MatchTab tab) {
    switch (tab) {
      case MatchTab.finished:
        return list.where((m) => m.status.finished).toList();
      case MatchTab.live:
        return list
            .where((m) => m.status.started && !m.status.finished)
            .toList();
      case MatchTab.upcoming:
        return list.where((m) => !m.status.started).toList();
    }
  }

  static Map<String, List<MatchModel>> groupUpcomingByDate(
    List<MatchModel> matches,
  ) {
    final Map<String, List<MatchModel>> map = {};

    for (final match in matches) {
      final d = match.time;
      final key =
          '${d.year.toString().padLeft(4, '0')}-'
          '${d.month.toString().padLeft(2, '0')}-'
          '${d.day.toString().padLeft(2, '0')}';

      map.putIfAbsent(key, () => []).add(match);
    }

    final sortedKeys = map.keys.toList()..sort();
    final Map<String, List<MatchModel>> sortedMap = {};

    for (final k in sortedKeys) {
      sortedMap[k] = map[k]!..sort((a, b) => a.time.compareTo(b.time));
    }

    return sortedMap;
  }

  static Map<String, List<MatchModel>> groupByLeague({
    required List<MatchModel> matches,
    required Map<int, String> leagueNameMap,
    required Map<int, int> leaguePriority,
  }) {
    final Map<int, List<MatchModel>> temp = {};

    for (final match in matches) {
      temp.putIfAbsent(match.leagueId, () => []).add(match);
    }

    final sortedLeagueIds = temp.keys.toList()
      ..sort((a, b) {
        final pa = leaguePriority[a] ?? 999;
        final pb = leaguePriority[b] ?? 999;
        return pa.compareTo(pb);
      });

    final Map<String, List<MatchModel>> result = {};

    for (final leagueId in sortedLeagueIds) {
      final leagueName = leagueNameMap[leagueId] ?? 'Other Matches';

      result[leagueName] = temp[leagueId]!
        ..sort((a, b) => a.time.compareTo(b.time));
    }

    return result;
  }

  static String sectionTitle({required String key, required MatchTab tab}) {
    if (tab != MatchTab.upcoming) return key;
    return DateHelper.groupLabel(DateTime.parse('${key}T00:00:00'));
  }
}
