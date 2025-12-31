import 'package:goalnow_app/model/player/injury_model.dart';
import 'package:goalnow_app/model/player/player_base.dart';

class SquadPlayerModel {
  final PlayerBaseModel base;

  final int? shirtNumber;
  final String position;
  final String positionDesc;
  final double? rating;

  final int goals;
  final int assists;
  final int yellowCards;
  final int redCards;

  final bool injured;
  final InjuryModel? injury;

  final int? transferValue;
  final bool excludeFromRanking;

  SquadPlayerModel({
    required this.base,
    this.shirtNumber,
    required this.position,
    required this.positionDesc,
    this.rating,
    required this.goals,
    required this.assists,
    required this.yellowCards,
    required this.redCards,
    required this.injured,
    this.injury,
    this.transferValue,
    required this.excludeFromRanking,
  });

  factory SquadPlayerModel.fromJson(Map<String, dynamic> json) {
    return SquadPlayerModel(
      base: PlayerBaseModel.fromJson(json),
      shirtNumber: json['shirtNumber'],
      position: json['role']['fallback'],
      positionDesc: json['positionIdsDesc'] ?? '',
      rating: (json['rating'] as num?)?.toDouble(),
      goals: json['goals'] ?? 0,
      assists: json['assists'] ?? 0,
      yellowCards: json['ycards'] ?? 0,
      redCards: json['rcards'] ?? 0,
      injured: json['injured'] == true,
      injury: json['injury'] != null
          ? InjuryModel.fromJson(json['injury'])
          : null,
      transferValue: json['transferValue'],
      excludeFromRanking: json['excludeFromRanking'] ?? false,
    );
  }
}
