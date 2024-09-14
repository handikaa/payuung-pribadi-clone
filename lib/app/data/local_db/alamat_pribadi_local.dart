import 'package:hive/hive.dart';

part 'alamat_pribadi_local.g.dart';

@HiveType(typeId: 1)
class AlamatPribadi extends HiveObject {
  @HiveField(0)
  String? nik;

  @HiveField(1)
  String? alamatSesuaiKTP;

  @HiveField(2)
  String? kodePosKTP;

  @HiveField(3)
  String? provinceSelectedKTP;

  @HiveField(4)
  String? citySelectedKTP;

  @HiveField(5)
  String? kecamatanSelectedKTP;

  @HiveField(6)
  String? kelurahanSelectedKTP;

  @HiveField(7)
  String? alamatDomisili;

  @HiveField(8)
  String? kodePosDomisili;

  @HiveField(9)
  String? provinceSelectedDomisili;

  @HiveField(10)
  String? citySelectedDomisili;

  @HiveField(11)
  String? kecamatanSelectedDomisili;

  @HiveField(12)
  String? kelurahanSelectedDomisili;

  AlamatPribadi({
    this.nik,
    this.alamatSesuaiKTP,
    this.kodePosKTP,
    this.provinceSelectedKTP,
    this.citySelectedKTP,
    this.kecamatanSelectedKTP,
    this.kelurahanSelectedKTP,
    this.alamatDomisili,
    this.kodePosDomisili,
    this.provinceSelectedDomisili,
    this.citySelectedDomisili,
    this.kecamatanSelectedDomisili,
    this.kelurahanSelectedDomisili,
  });
}
