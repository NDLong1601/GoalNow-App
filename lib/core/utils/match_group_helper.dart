import 'package:goalnow_app/core/enum/enum.dart';
import 'package:goalnow_app/core/utils/date_helper.dart';
import 'package:goalnow_app/model/match/match.dart';

/// Helper class for match grouping and filtering
class MatchGroupHelper {
  static List<MatchModel> filterByTab(List<MatchModel> list, MatchTab tab) {
    switch (tab) {
      case MatchTab.finished:
        return list.where((match) => match.status.finished).toList();
      case MatchTab.live:
        return list
            .where((match) => match.status.started && !match.status.finished)
            .toList();
      case MatchTab.upcoming:
        return list.where((match) => !match.status.started).toList();
    }
  }

  /// GROUP UPCOMING MATCHES BY DATE
  static Map<String, List<MatchModel>> groupUpcomingByDate(
    List<MatchModel> matches,
  ) {
    final Map<String, List<MatchModel>> map = {};

    for (final match in matches) {
      final date = match.time;
      final key =
          '${date.year.toString().padLeft(4, '0')}-'
          '${date.month.toString().padLeft(2, '0')}-'
          '${date.day.toString().padLeft(2, '0')}';

      map.putIfAbsent(key, () => []).add(match);
    }

    final sortedKeys = map.keys.toList()..sort();
    final Map<String, List<MatchModel>> sortedMap = {};

    for (final i in sortedKeys) {
      sortedMap[i] = map[i]!..sort((a, b) => a.time.compareTo(b.time));
    }

    return sortedMap;
  }

  /// GROUP MATCHES BY LEAGUE WITH PRIORITY
  static Map<String, List<MatchModel>> groupByLeague({
    required List<MatchModel> matches,
    required Map<int, String> leagueNameMap,
    required Map<int, int> leaguePriority,
  }) {
    final Map<int, List<MatchModel>> temp = {};

    // Group matches by leagueId
    for (final match in matches) {
      temp.putIfAbsent(match.leagueId, () => []).add(match);
    }
    
    // Sort leagueIds by priority
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

  /// Lấy tiêu đề nhóm theo tab
  static String sectionTitle({required String key, required MatchTab tab}) {
    if (tab != MatchTab.upcoming) return key;
    return DateHelper.groupLabel(DateTime.parse('${key}T00:00:00'));
  }
}
