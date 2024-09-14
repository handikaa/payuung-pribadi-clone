// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_profile.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileInformationAdapter extends TypeAdapter<ProfileInformation> {
  @override
  final int typeId = 0;

  @override
  ProfileInformation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileInformation(
      namaLengkap: fields[0] as String?,
      email: fields[1] as String?,
      noHp: fields[2] as String?,
      selectedDate: fields[3] as String?,
      genderSelected: fields[4] as String?,
      pendidikanSelected: fields[5] as String?,
      statusPernikahanSelected: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileInformation obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.namaLengkap)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.noHp)
      ..writeByte(3)
      ..write(obj.selectedDate)
      ..writeByte(4)
      ..write(obj.genderSelected)
      ..writeByte(5)
      ..write(obj.pendidikanSelected)
      ..writeByte(6)
      ..write(obj.statusPernikahanSelected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileInformationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
