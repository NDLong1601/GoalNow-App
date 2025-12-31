import 'package:goalnow_app/model/lineup/player_layout.dart';

class LineupPlayer {
  final int id;
  final String name;
  final String shirtNumber;
  final bool isCaptain;
  final PlayerLayout verticalLayout;

  final double? rating;

  LineupPlayer({
    required this.id,
    required this.name,
    required this.shirtNumber,
    required this.verticalLayout,
    this.isCaptain = false,
    this.rating,
  });

  factory LineupPlayer.fromJson(Map<String, dynamic> json) {
    double? rating;

    final perf = json['performance'];
    if (perf is Map<String, dynamic>) {
      final r = perf['rating'];
      if (r is num) {
        rating = r.toDouble();
      }
    }

    return LineupPlayer(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      shirtNumber: (json['shirtNumber'] ?? '').toString(),
      isCaptain: json['isCaptain'] ?? false,
      verticalLayout: PlayerLayout.fromJson(
        (json['verticalLayout'] as Map?)?.cast<String, dynamic>() ??
            const {'x': 0.5, 'y': 0.5, 'width': 0.2, 'height': 0.2},
      ),
      rating: rating,
    );
  }

  LineupPlayer copyWith({
    int? id,
    String? name,
    String? shirtNumber,
    bool? isCaptain,
    PlayerLayout? verticalLayout,
  }) {
    return LineupPlayer(
      id: id ?? this.id,
      name: name ?? this.name,
      shirtNumber: shirtNumber ?? this.shirtNumber,
      isCaptain: isCaptain ?? this.isCaptain,
      verticalLayout: verticalLayout ?? this.verticalLayout,
      rating: rating,
    );
  }
}
