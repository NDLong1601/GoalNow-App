class InjuryModel {
  final String? id;
  final String? expectedReturn;

  InjuryModel({
    this.id,
    this.expectedReturn,
  });

  factory InjuryModel.fromJson(Map<String, dynamic> json) {
    return InjuryModel(
      id: json['id']?.toString(),
      expectedReturn: json['expectedReturn'],
    );
  }
}
