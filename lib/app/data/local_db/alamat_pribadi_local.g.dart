// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alamat_pribadi_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlamatPribadiAdapter extends TypeAdapter<AlamatPribadi> {
  @override
  final int typeId = 1;

  @override
  AlamatPribadi read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlamatPribadi(
      nik: fields[0] as String?,
      alamatSesuaiKTP: fields[1] as String?,
      kodePosKTP: fields[2] as String?,
      provinceSelectedKTP: fields[3] as String?,
      citySelectedKTP: fields[4] as String?,
      kecamatanSelectedKTP: fields[5] as String?,
      kelurahanSelectedKTP: fields[6] as String?,
      alamatDomisili: fields[7] as String?,
      kodePosDomisili: fields[8] as String?,
      provinceSelectedDomisili: fields[9] as String?,
      citySelectedDomisili: fields[10] as String?,
      kecamatanSelectedDomisili: fields[11] as String?,
      kelurahanSelectedDomisili: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AlamatPribadi obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.nik)
      ..writeByte(1)
      ..write(obj.alamatSesuaiKTP)
      ..writeByte(2)
      ..write(obj.kodePosKTP)
      ..writeByte(3)
      ..write(obj.provinceSelectedKTP)
      ..writeByte(4)
      ..write(obj.citySelectedKTP)
      ..writeByte(5)
      ..write(obj.kecamatanSelectedKTP)
      ..writeByte(6)
      ..write(obj.kelurahanSelectedKTP)
      ..writeByte(7)
      ..write(obj.alamatDomisili)
      ..writeByte(8)
      ..write(obj.kodePosDomisili)
      ..writeByte(9)
      ..write(obj.provinceSelectedDomisili)
      ..writeByte(10)
      ..write(obj.citySelectedDomisili)
      ..writeByte(11)
      ..write(obj.kecamatanSelectedDomisili)
      ..writeByte(12)
      ..write(obj.kelurahanSelectedDomisili);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlamatPribadiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
