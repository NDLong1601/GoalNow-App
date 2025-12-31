import 'package:hive/hive.dart';

part 'top_player_local_model.g.dart';

@HiveType(typeId: 2)
class TopPlayerLocalModel extends HiveObject {
  /// League ID (e.g. 47, 87...)
  @HiveField(0)
  final int leagueId;

  /// Tab type: 'goal' | 'assist'
  @HiveField(1)
  final String tab;

  /// Raw JSON response (string)
  @HiveField(2)
  final String rawJson;

  /// Save timestamp (millisecondsSinceEpoch)
  @HiveField(3)
  final int savedAt;

  TopPlayerLocalModel({
    required this.leagueId,
    required this.tab,
    required this.rawJson,
    required this.savedAt,
  });

  /// Helper: check cache expiration
  bool isExpired(Duration ttl) {
    final now = DateTime.now().millisecondsSinceEpoch;
    return now - savedAt > ttl.inMilliseconds;
  }
}
