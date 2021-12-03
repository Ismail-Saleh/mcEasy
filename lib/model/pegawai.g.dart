// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pegawai.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PegawaiAdapter extends TypeAdapter<Pegawai> {
  @override
  final int typeId = 0;

  @override
  Pegawai read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pegawai(
      fields[3] as String?,
      fields[2] as String?,
      fields[0] as int?,
      fields[1] as int?,
      fields[5] as String?,
      fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Pegawai obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.no)
      ..writeByte(1)
      ..write(obj.nomorInduk)
      ..writeByte(2)
      ..write(obj.nama)
      ..writeByte(3)
      ..write(obj.alamat)
      ..writeByte(4)
      ..write(obj.tanggalLahir)
      ..writeByte(5)
      ..write(obj.tanggalBergabung);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PegawaiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
