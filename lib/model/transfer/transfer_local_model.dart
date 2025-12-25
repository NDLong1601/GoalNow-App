import 'package:hive/hive.dart';

part 'transfer_local_model.g.dart';

@HiveType(typeId: 1)
class TransferLocalModel extends HiveObject {
  @HiveField(0)
  int playerId;

  @HiveField(1)
  String name;

  @HiveField(2)
  String fromClub;

  @HiveField(3)
  String toClub;

  @HiveField(4)
  int marketValue;

  @HiveField(5)
  String positionLabel;

  @HiveField(6)
  String positionKey;

  @HiveField(7)
  DateTime fromDate;

  @HiveField(8)
  DateTime toDate;

  @HiveField(9)
  bool onLoan;

  TransferLocalModel({
    required this.playerId,
    required this.name,
    required this.fromClub,
    required this.toClub,
    required this.marketValue,
    required this.positionLabel,
    required this.positionKey,
    required this.fromDate,
    required this.toDate,
    required this.onLoan,
  });
}
