import 'package:goalnow_app/model/lineup/player_layout.dart';

class LineupPlayer {
  final int id;
  final String name;
  final String shirtNumber;
  final bool isCaptain;
  final PlayerLayout verticalLayout;

  LineupPlayer({
    required this.id,
    required this.name,
    required this.shirtNumber,
    required this.verticalLayout,
    this.isCaptain = false,
  });

  factory LineupPlayer.fromJson(Map<String, dynamic> json) {
    return LineupPlayer(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      shirtNumber: json['shirtNumber'] ?? '',
      isCaptain: json['isCaptain'] ?? false,
      verticalLayout: PlayerLayout.fromJson(json['verticalLayout']),
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
    );
  }
}
