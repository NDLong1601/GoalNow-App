// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_player_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TopPlayerLocalModelAdapter extends TypeAdapter<TopPlayerLocalModel> {
  @override
  final int typeId = 2;

  @override
  TopPlayerLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TopPlayerLocalModel(
      leagueId: fields[0] as int,
      tab: fields[1] as String,
      rawJson: fields[2] as String,
      savedAt: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TopPlayerLocalModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.leagueId)
      ..writeByte(1)
      ..write(obj.tab)
      ..writeByte(2)
      ..write(obj.rawJson)
      ..writeByte(3)
      ..write(obj.savedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TopPlayerLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
