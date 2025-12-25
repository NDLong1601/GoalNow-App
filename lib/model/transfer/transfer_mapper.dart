import 'package:goalnow_app/model/transfer/transfer.dart';
import 'package:goalnow_app/model/transfer/transfer_local_model.dart';

class TransferMapper {
  static TransferLocalModel toLocal(TransferModel t) {
    return TransferLocalModel(
      playerId: t.playerId,
      name: t.name,
      fromClub: t.fromClub,
      toClub: t.toClub,
      marketValue: t.marketValue,
      positionLabel: t.position.label,
      positionKey: t.position.key,
      fromDate: t.fromDate,
      toDate: t.toDate,
      onLoan: t.onLoan,
    );
  }

  static TransferModel fromLocal(TransferLocalModel l) {
    return TransferModel(
      name: l.name,
      playerId: l.playerId,
      position: TransferPosition(label: l.positionLabel, key: l.positionKey),
      transferDate: DateTime.now(),
      transferText: const [],
      fromClub: l.fromClub,
      fromClubId: 0,
      toClub: l.toClub,
      toClubId: 0,
      fee: const TransferFee(feeText: 'offline', localizedFeeText: 'offline'),
      transferType: const TransferType(
        text: 'offline',
        localizationKey: 'offline',
      ),
      contractExtension: false,
      onLoan: l.onLoan,
      fromDate: l.fromDate,
      toDate: l.toDate,
      marketValue: l.marketValue,
    );
  }
}
