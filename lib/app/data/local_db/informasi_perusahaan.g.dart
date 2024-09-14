// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'informasi_perusahaan.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InformasiPerusahaanAdapter extends TypeAdapter<InformasiPerusahaan> {
  @override
  final int typeId = 2;

  @override
  InformasiPerusahaan read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InformasiPerusahaan(
      namaUsaha: fields[0] as String?,
      alamatUsaha: fields[1] as String?,
      jabatan: fields[2] as String?,
      lamaBekerja: fields[3] as String?,
      sumberPendapatan: fields[4] as String?,
      pendapatanKotorTahunan: fields[5] as String?,
      namaBank: fields[6] as String?,
      cabangBank: fields[7] as String?,
      nomorRekening: fields[8] as String?,
      namaPemilikRekening: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, InformasiPerusahaan obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.namaUsaha)
      ..writeByte(1)
      ..write(obj.alamatUsaha)
      ..writeByte(2)
      ..write(obj.jabatan)
      ..writeByte(3)
      ..write(obj.lamaBekerja)
      ..writeByte(4)
      ..write(obj.sumberPendapatan)
      ..writeByte(5)
      ..write(obj.pendapatanKotorTahunan)
      ..writeByte(6)
      ..write(obj.namaBank)
      ..writeByte(7)
      ..write(obj.cabangBank)
      ..writeByte(8)
      ..write(obj.nomorRekening)
      ..writeByte(9)
      ..write(obj.namaPemilikRekening);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InformasiPerusahaanAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
