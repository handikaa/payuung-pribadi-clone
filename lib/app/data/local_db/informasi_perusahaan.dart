import 'package:hive/hive.dart';

part 'informasi_perusahaan.g.dart';

@HiveType(typeId: 2)
class InformasiPerusahaan extends HiveObject {
  @HiveField(0)
  String? namaUsaha;

  @HiveField(1)
  String? alamatUsaha;

  @HiveField(2)
  String? jabatan;

  @HiveField(3)
  String? lamaBekerja;

  @HiveField(4)
  String? sumberPendapatan;

  @HiveField(5)
  String? pendapatanKotorTahunan;

  @HiveField(6)
  String? namaBank;

  @HiveField(7)
  String? cabangBank;

  @HiveField(8)
  String? nomorRekening;

  @HiveField(9)
  String? namaPemilikRekening;

  InformasiPerusahaan({
    this.namaUsaha,
    this.alamatUsaha,
    this.jabatan,
    this.lamaBekerja,
    this.sumberPendapatan,
    this.pendapatanKotorTahunan,
    this.namaBank,
    this.cabangBank,
    this.nomorRekening,
    this.namaPemilikRekening,
  });
}
