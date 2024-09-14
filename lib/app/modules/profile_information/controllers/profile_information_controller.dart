import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/local_db/alamat_pribadi_local.dart';
import '../../../data/local_db/informasi_perusahaan.dart';
import '../../../data/local_db/local_profile.dart';
import '../../../widget/icon_photo.dart';

class ProfileInformationController extends GetxController {
  RxBool isSelected = true.obs;
  RxInt currentStep = 0.obs;
  XFile? image;
  RxString namefile = ''.obs;

  final List<String> genderList = ['Laki-Laki', 'Perempuan'];
  final List<String> pendidikan = [
    'SD',
    'SMP',
    'SMA',
    'D1',
    'D2',
    'D3',
    'S1',
    'S2',
    'S3'
  ];
  final List<String> statusPernikahan = [
    'Belum Kawin',
    'Kawin',
    'Janda',
    'Duda'
  ];

// Biodata Diri
  TextEditingController namaLengkapC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController noHpC = TextEditingController();
  RxString selectedDate = ''.obs;
  RxString genderSelected = ''.obs;
  RxString pendidikanSelected = ''.obs;
  RxString statusPernikahanSelected = ''.obs;

// Alamat pribadi
  TextEditingController nikC = TextEditingController();
  TextEditingController alamatSesuaiKTP = TextEditingController();
  TextEditingController kodePos = TextEditingController();
  RxString provinceSelected = ''.obs;
  RxString citySelected = ''.obs;
  RxString kecamatanSelected = ''.obs;
  RxString kelurahanSelected = ''.obs;
  TextEditingController alamatDomisili = TextEditingController();
  TextEditingController kodePosDomisili = TextEditingController();
  RxString provinceSelectedDomisili = ''.obs;
  RxString citySelectedDomisili = ''.obs;
  RxString kecamatanSelectedDomisili = ''.obs;
  RxString kelurahanSelectedDomisili = ''.obs;

// Informasi Perusahaan
  TextEditingController namaUsahaC = TextEditingController();
  TextEditingController alamatUsahaC = TextEditingController();
  TextEditingController cabangBankC = TextEditingController();
  TextEditingController nomorRekC = TextEditingController();
  TextEditingController namaPemilikRekC = TextEditingController();
  RxString jabatanSelected = ''.obs;
  RxString lamaBekerjaSelected = ''.obs;
  RxString sumberPendapatanSelected = ''.obs;
  RxString pendapatanKotorSelected = ''.obs;
  RxString namaBankSelected = ''.obs;

  final List<String> provinceList = [
    'Bangka Belitung',
    'Bali',
    'DKI Jakarta',
    'Jawa Barat',
    'Jawa Tengah',
    'Jawa Timur',
    'Jambi',
    'DKI Gorontalo',
  ];

  final List<String> cityList = [
    'Garut',
    'Cirebon',
    'Bogor',
    'Jakart',
    'Sukabumi',
  ];

  final List<String> kecamatanList = [
    'Cibinong',
    'Gunung Putri',
    'Cileungsi',
    'Jonggol',
    'Cisarua',
  ];

  final List<String> kelurahanList = [
    'Cijujung',
    'Cikeas',
    'Cibanon',
    'Cimandala',
    'Pasir Jambut',
  ];

  final List<String> jabatanList = [
    'Non-Staf',
    'Staf',
    'Supervisor',
    'Manajer',
    'Direktur',
    'Lainnya',
  ];

  final List<String> lamaBekerjaList = [
    '< 6 Bulan',
    '6 Bulan - 1 Tahun',
    '1 - 2 Tahun',
    '2 > Tahun',
  ];

  final List<String> sumberPendapatanList = [
    'Gaji',
    'Keuntungan Bisnis',
    'Bunga Tabungan',
    'Warisan',
    'Dana dari orang tua atau anak',
    'Undian',
    'Keuntungan investas',
    'Lainnya',
  ];

  final List<String> pendapatanKotorList = [
    '< 10 Juta',
    '10 - 50 Juta',
    '50 - 100 Juta',
    '100 - 500 Juta',
    '500 Juta - 1 Milyar',
    '> 1 Milyar',
  ];

  final List<String> namaBankList = [
    'BANK BCA',
    'BANK BRI',
    'BANK BNI',
    'BANK MANDIRI',
    'BANK PANIN',
    'BANK BJB',
  ];

  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      selectedDate.value = DateFormat('dd MMMM yyyy').format(picked);
    }
  }

  Future<void> loadProfileInformation() async {
    var box = Hive.box<ProfileInformation>('profileBox');
    final profile = box.get('profile');

    if (profile != null) {
      namaLengkapC.text = profile.namaLengkap ?? '';
      emailC.text = profile.email ?? '';
      noHpC.text = profile.noHp ?? '';
      selectedDate.value = profile.selectedDate ?? '';
      genderSelected.value = profile.genderSelected ?? '';
      pendidikanSelected.value = profile.pendidikanSelected ?? '';
      statusPernikahanSelected.value = profile.statusPernikahanSelected ?? '';
    }
  }

  // Future<void> loadProfileInformation() async {
  //   ProfileInformation profileData =
  //       await HiveLocalDatabase.getProfileInformation();

  //   print('wkwkwkwkwk :${profileData}');
  //   if (profileData.isInBox) {
  //     print('ada');
  //     namaLengkapC.text = profileData.namaLengkap ?? '';
  //     emailC.text = profileData.email ?? '';
  //     noHpC.text = profileData.noHp ?? '';
  //     selectedDate.value = profileData.selectedDate ?? '';
  //     genderSelected.value = profileData.genderSelected ?? '';
  //     pendidikanSelected.value = profileData.pendidikanSelected ?? '';
  //     statusPernikahanSelected.value =
  //         profileData.statusPernikahanSelected ?? '';
  //   } else {
  //     print('Ga ada');
  //   }
  // }

  Future<void> loadAlamatPribadi() async {
    var box = Hive.box<AlamatPribadi>('alamatBox');
    final alamat = box.get('alamat');

    if (alamat != null) {
      nikC.text = alamat.nik ?? '';
      alamatSesuaiKTP.text = alamat.alamatSesuaiKTP ?? '';
      provinceSelected.value = alamat.provinceSelectedKTP ?? '';
      citySelected.value = alamat.citySelectedKTP ?? '';
      kecamatanSelected.value = alamat.kecamatanSelectedKTP ?? '';
      kelurahanSelected.value = alamat.kelurahanSelectedKTP ?? '';
      kodePos.text = alamat.kodePosKTP ?? '';
      alamatDomisili.text = alamat.alamatDomisili ?? '';
      provinceSelectedDomisili.value = alamat.provinceSelectedDomisili ?? '';
      citySelectedDomisili.value = alamat.citySelectedDomisili ?? '';
      kecamatanSelectedDomisili.value = alamat.kecamatanSelectedDomisili ?? '';
      kelurahanSelectedDomisili.value = alamat.kelurahanSelectedDomisili ?? '';
      kodePosDomisili.text = alamat.kodePosDomisili ?? '';
    }
  }

  Future<void> loadInformasiPerusahaan() async {
    var box = Hive.box<InformasiPerusahaan>('informasiPerusahaanBox');
    final informasiPerusahaan = box.get('informasiPerusahaan');

    if (informasiPerusahaan != null) {
      namaUsahaC.text = informasiPerusahaan.namaUsaha ?? '';
      alamatUsahaC.text = informasiPerusahaan.alamatUsaha ?? '';
      jabatanSelected.value = informasiPerusahaan.jabatan ?? '';
      lamaBekerjaSelected.value = informasiPerusahaan.lamaBekerja ?? '';
      sumberPendapatanSelected.value =
          informasiPerusahaan.sumberPendapatan ?? '';
      pendapatanKotorSelected.value =
          informasiPerusahaan.pendapatanKotorTahunan ?? '';
      namaBankSelected.value = informasiPerusahaan.namaBank ?? '';
      cabangBankC.text = informasiPerusahaan.cabangBank ?? '';
      nomorRekC.text = informasiPerusahaan.nomorRekening ?? '';
      namaPemilikRekC.text = informasiPerusahaan.namaPemilikRekening ?? '';
    }
  }

  Future<void> pickImageGallery() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    namefile.value = image!.path;
    Get.back();
    update();
  }

  Future<void> pickImageCamera() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.camera);
    namefile.value = image!.path;
    Get.back();
    update();
  }

  void showBottomsheet() {
    print('object');
    Get.bottomSheet(Container(
      height: 170,
      width: Get.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            Container(
              height: 10,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromRGBO(165, 165, 165, 1),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'Profile Foto',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconeditprofile(
                  title: 'Camera',
                  icon: Icons.camera_alt_outlined,
                  colorIcon: Colors.amber,
                  function: () => pickImageCamera(),
                ),
                const SizedBox(
                  width: 50,
                ),
                iconeditprofile(
                  title: 'Gallery',
                  icon: Icons.photo_size_select_actual_outlined,
                  colorIcon: Colors.amber,
                  function: () => pickImageGallery(),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
