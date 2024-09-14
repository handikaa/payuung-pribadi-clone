import 'package:hive/hive.dart';

part 'local_profile.g.dart';

@HiveType(typeId: 0)
class ProfileInformation extends HiveObject {
  @HiveField(0)
  String? namaLengkap;

  @HiveField(1)
  String? email;

  @HiveField(2)
  String? noHp;

  @HiveField(3)
  String? selectedDate;

  @HiveField(4)
  String? genderSelected;

  @HiveField(5)
  String? pendidikanSelected;

  @HiveField(6)
  String? statusPernikahanSelected;

  ProfileInformation({
    this.namaLengkap,
    this.email,
    this.noHp,
    this.selectedDate,
    this.genderSelected,
    this.pendidikanSelected,
    this.statusPernikahanSelected,
  });
}
