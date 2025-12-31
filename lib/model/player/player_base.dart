class PlayerBaseModel {
  final int id;
  final String name;
  final String? countryCode;
  final String? countryName;
  final int? age;
  final int? height;
  final String? dateOfBirth;

  PlayerBaseModel({
    required this.id,
    required this.name,
    this.countryCode,
    this.countryName,
    this.age,
    this.height,
    this.dateOfBirth,
  });

  factory PlayerBaseModel.fromJson(Map<String, dynamic> json) {
    return PlayerBaseModel(
      id: json['id'],
      name: json['name'],
      countryCode: json['ccode'],
      countryName: json['cname'],
      age: json['age'],
      height: json['height'],
      dateOfBirth: json['dateOfBirth'],
    );
  }
}
