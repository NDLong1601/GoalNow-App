class TransferModel {
  final String name;
  final int playerId;
  final TransferPosition position;

  final DateTime transferDate;

  final List<String?> transferText;

  final String fromClub;
  final int fromClubId;

  final String toClub;
  final int toClubId;

  final TransferFee fee;
  final TransferType transferType;

  final bool contractExtension;
  final bool onLoan;

  final DateTime fromDate;
  final DateTime toDate;

  final int marketValue;

  // CONSTRUCTOR
  TransferModel({
    required this.name,
    required this.playerId,
    required this.position,
    required this.transferDate,
    required this.transferText,
    required this.fromClub,
    required this.fromClubId,
    required this.toClub,
    required this.toClubId,
    required this.fee,
    required this.transferType,
    required this.contractExtension,
    required this.onLoan,
    required this.fromDate,
    required this.toDate,
    required this.marketValue,
  });

  // FROM JSON
  factory TransferModel.fromJson(Map<String, dynamic> json) {
    return TransferModel(
      name: (json['name'] ?? '').toString(),
      playerId: _toInt(json['playerId']),
      position: TransferPosition.fromJson(
        (json['position'] as Map?)?.cast<String, dynamic>() ?? const {},
      ),
      transferText: ((json['transferText'] as List?) ?? const [])
          .map((e) => e?.toString())
          .toList(),
      fromClub: (json['fromClub'] ?? '').toString(),
      fromClubId: _toInt(json['fromClubId']),
      toClub: (json['toClub'] ?? '').toString(),
      toClubId: _toInt(json['toClubId']),
      fee: TransferFee.fromJson(
        (json['fee'] as Map?)?.cast<String, dynamic>() ?? const {},
      ),
      transferType: TransferType.fromJson(
        (json['transferType'] as Map?)?.cast<String, dynamic>() ?? const {},
      ),
      contractExtension: (json['contractExtension'] as bool?) ?? false,
      onLoan: (json['onLoan'] as bool?) ?? false,
      fromDate: _parseDate(json['fromDate']),
      toDate: _parseDate(json['toDate']),
      transferDate: _parseDate(json['transferDate']),

      marketValue: _toInt(json['marketValue']),
    );
  }

  // Helper to convert dynamic to int
  static int _toInt(dynamic v) {
    if (v is int) return v;
    if (v is double) return v.toInt();
    return int.tryParse((v ?? '0').toString()) ?? 0;
  }

  // Helper to parse date safely
  static DateTime _parseDate(dynamic value) {
    if (value == null) {
      return DateTime.fromMillisecondsSinceEpoch(0);
    }

    final s = value.toString();
    if (s.isEmpty) {
      return DateTime.fromMillisecondsSinceEpoch(0);
    }

    return DateTime.tryParse(s) ?? DateTime.fromMillisecondsSinceEpoch(0);
  }
}

class TransferPosition {
  // "CB", "LB"
  final String label;
  // "centerback_short"
  final String key;

  const TransferPosition({required this.label, required this.key});

  factory TransferPosition.fromJson(Map<String, dynamic> json) {
    return TransferPosition(
      label: (json['label'] ?? '').toString(),
      key: (json['key'] ?? '').toString(),
    );
  }
}

// Transfer Fee Details
class TransferFee {
  // "free transfer", "on loan"
  final String feeText;
  final String localizedFeeText;

  const TransferFee({required this.feeText, required this.localizedFeeText});

  factory TransferFee.fromJson(Map<String, dynamic> json) {
    return TransferFee(
      feeText: (json['feeText'] ?? '').toString(),
      localizedFeeText: (json['localizedFeeText'] ?? '').toString(),
    );
  }
}

// Transfer Type Details
class TransferType {
  final String text;
  final String localizationKey;

  const TransferType({required this.text, required this.localizationKey});

  factory TransferType.fromJson(Map<String, dynamic> json) {
    return TransferType(
      text: (json['text'] ?? '').toString(),
      localizationKey: (json['localizationKey'] ?? '').toString(),
    );
  }
}
