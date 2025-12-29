class Data {
  /// Mapping of league IDs to their names
  static const Map<int, String> leagueNameMap = {
    894202: 'UEFA Champions League',
    47: 'Premier League',
    87: 'La Liga',
    77: 'World Cup',
    54: 'Bundesliga',
    73: 'Europa League',
    53: 'Ligue 1',
    55: 'Serie A',
    132: 'Fa Cup',
  };

  /// Priority mapping for leagues
  static const Map<int, int> leaguePriority = {
    894202: 1, // UEFA Champions League
    77: 2,     // World Cup
    47: 3,     // Premier League
    87: 4,     // La Liga
    54: 5,     // Bundesliga
    55: 6,     // Serie A
    53: 7,     // Ligue 1
    73: 8,     // Europa League
    132: 9,    // Fa Cup
  };

  /// Private constructor to prevent instantiation
  Data._();

  /// Get league name by ID
  static String getLeagueName(int leagueId) {
    return leagueNameMap[leagueId] ?? 'Other Matches';
  }

  /// Get league priority by ID
  static int getLeaguePriority(int leagueId) {
    return leaguePriority[leagueId] ?? 999;
  }
}
