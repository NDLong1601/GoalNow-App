import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class NewsModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String imageUrl;

  @HiveField(3)
  final DateTime time;

  @HiveField(4)
  final String source;

  @HiveField(5)
  final String detailPath;

  NewsModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.time,
    required this.source,
    required this.detailPath,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
