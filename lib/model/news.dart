import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class NewsModel {
  final String id;

  final String title;

  final String imageUrl;

  final DateTime time;

  final String source;

  final String detailPath;

  NewsModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.time,
    required this.source,
    required this.detailPath,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      time: DateTime.parse(json['gmtTime']),
      source: json['sourceStr'],
      detailPath: json['page']['url'],
    );
  }
}
