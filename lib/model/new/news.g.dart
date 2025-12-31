// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsModelAdapter extends TypeAdapter<NewsModel> {
  @override
  final int typeId = 0;

  @override
  NewsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsModel(
      id: fields[0] as String,
      title: fields[1] as String,
      imageUrl: fields[2] as String,
      time: fields[3] as DateTime,
      source: fields[4] as String,
      detailPath: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NewsModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.source)
      ..writeByte(5)
      ..write(obj.detailPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      time: DateTime.parse(json['time'] as String),
      source: json['source'] as String,
      detailPath: json['detailPath'] as String,
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'time': instance.time.toIso8601String(),
      'source': instance.source,
      'detailPath': instance.detailPath,
    };
