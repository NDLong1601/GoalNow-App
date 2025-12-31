import 'package:goalnow_app/model/player/player_base.dart';
import 'package:goalnow_app/model/team/team_colors.dart';

class TopStatPlayerModel {
  final PlayerBaseModel base;

  final int teamId;
  final String teamName;

  final String statName;
  final int value;

  final TeamColors teamColors;

  TopStatPlayerModel({
    required this.base,
    required this.teamId,
    required this.teamName,
    required this.statName,
    required this.value,
    required this.teamColors,
  });

  factory TopStatPlayerModel.fromJson(Map<String, dynamic> json) {
    return TopStatPlayerModel(
      base: PlayerBaseModel.fromJson(json),
      teamId: json['teamId'] as int,
      teamName: json['teamName'] as String,
      statName: json['stat'] != null
          ? json['stat']['name'] as String
          : json['statName'] as String,
      value: json['value'] as int,
      teamColors: TeamColors.fromJson(json['teamColors']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      /// Player base
      'id': base.id,
      'name': base.name,
      'ccode': base.countryCode,
      'cname': base.countryName,
      'age': base.age,
      'height': base.height,
      'dateOfBirth': base.dateOfBirth,

      /// Team
      'teamId': teamId,
      'teamName': teamName,

      /// Stat
      'stat': {
        'name': statName,
        'value': value,
      },
      'value': value,

      /// Colors
      'teamColors': teamColors.toJson(),
    };
  }
}
