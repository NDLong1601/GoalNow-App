// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransferLocalModelAdapter extends TypeAdapter<TransferLocalModel> {
  @override
  final int typeId = 1;

  @override
  TransferLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransferLocalModel(
      playerId: fields[0] as int,
      name: fields[1] as String,
      fromClub: fields[2] as String,
      toClub: fields[3] as String,
      marketValue: fields[4] as int,
      positionLabel: fields[5] as String,
      positionKey: fields[6] as String,
      fromDate: fields[7] as DateTime,
      toDate: fields[8] as DateTime,
      onLoan: fields[9] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TransferLocalModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.playerId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.fromClub)
      ..writeByte(3)
      ..write(obj.toClub)
      ..writeByte(4)
      ..write(obj.marketValue)
      ..writeByte(5)
      ..write(obj.positionLabel)
      ..writeByte(6)
      ..write(obj.positionKey)
      ..writeByte(7)
      ..write(obj.fromDate)
      ..writeByte(8)
      ..write(obj.toDate)
      ..writeByte(9)
      ..write(obj.onLoan);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransferLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
