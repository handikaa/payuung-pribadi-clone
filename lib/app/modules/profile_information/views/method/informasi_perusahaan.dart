import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../../../utils/helper.dart';
import '../../../../data/local_db/informasi_perusahaan.dart';
import '../../../../method/space.dart';
import '../../../../widget/input_form.dart';
import '../../controllers/profile_information_controller.dart';
import 'build_jabatan_dropdown.dart';
import 'build_lama_bekerja_dropdown.dart';
import 'build_nama_bank_dropdown.dart';
import 'build_pendapatan_kotor_dropdown.dart';
import 'build_sumber_pendapatan_dropdown.dart';

Widget buildStepContent3({
  required ProfileInformationController controller,
}) {
  controller.loadInformasiPerusahaan();
  return Column(
    children: [
      const Row(
        children: [
          Text(
            'NAMA USAHA/PERUSAHAAN',
          ),
        ],
      ),
      verticalSpace(10),
      InputForm(
        controller: controller.namaUsahaC,
      ),
      verticalSpace(20),
      const Row(
        children: [
          Text(
            'ALAMAT USAHA/PERUSAHAAN',
          ),
        ],
      ),
      verticalSpace(10),
      InputForm(
        controller: controller.alamatUsahaC,
      ),
      verticalSpace(20),
      Row(
        children: [
          horizontalSpace(5),
          const Text(
            'JABATAN',
          ),
        ],
      ),
      verticalSpace(10),
      buildJabatanDropdown(controller: controller),
      verticalSpace(20),
      Row(
        children: [
          horizontalSpace(5),
          const Text(
            'LAMA BEKERJA',
          ),
        ],
      ),
      verticalSpace(10),
      buildLamaBekerjaDropdown(controller: controller),
      verticalSpace(20),
      Row(
        children: [
          horizontalSpace(5),
          const Text(
            'SUMBER PENDAPATAN',
          ),
        ],
      ),
      verticalSpace(10),
      buildSumberPendapatanDropdown(controller: controller),
      verticalSpace(20),
      Row(
        children: [
          horizontalSpace(5),
          const Text(
            'PENDAPATAN KOTOT PERTAHUN',
          ),
        ],
      ),
      verticalSpace(10),
      buildPendapatanKotor(controller: controller),
      verticalSpace(20),
      Row(
        children: [
          horizontalSpace(5),
          const Text(
            'NAMA BANK',
          ),
        ],
      ),
      verticalSpace(10),
      buildNamaBank(controller: controller),
      verticalSpace(20),
      const Row(
        children: [
          Text(
            'CABANG BANK',
          ),
        ],
      ),
      verticalSpace(10),
      InputForm(
        controller: controller.cabangBankC,
      ),
      verticalSpace(20),
      const Row(
        children: [
          Text(
            'NOMOR REKENING',
          ),
        ],
      ),
      verticalSpace(10),
      InputForm(
        controller: controller.nomorRekC,
      ),
      verticalSpace(20),
      const Row(
        children: [
          Text(
            'NAMA PEMILIK REKENING',
          ),
        ],
      ),
      verticalSpace(10),
      InputForm(
        controller: controller.namaPemilikRekC,
      ),
      verticalSpace(20),
      Row(
        children: [
          Expanded(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(
                  color: Colors.amber,
                  width: 2.0,
                ),
              ),
              onPressed: () {
                controller.currentStep.value -= 1;
              },
              child: const Text(
                'Sebelumnya',
                style: TextStyle(color: Colors.amber),
              ),
            ),
          ),
          horizontalSpace(20),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async {
                var companyBox =
                    Hive.box<InformasiPerusahaan>('informasiPerusahaanBox');

                final companyInfo = InformasiPerusahaan(
                  namaUsaha: controller.namaUsahaC.text,
                  alamatUsaha: controller.alamatUsahaC.text,
                  jabatan: controller.jabatanSelected.value,
                  lamaBekerja: controller.lamaBekerjaSelected.value,
                  sumberPendapatan: controller.sumberPendapatanSelected.value,
                  pendapatanKotorTahunan:
                      controller.pendapatanKotorSelected.value,
                  namaBank: controller.namaBankSelected.value,
                  cabangBank: controller.cabangBankC.text,
                  nomorRekening: controller.nomorRekC.text,
                  namaPemilikRekening: controller.namaPemilikRekC.text,
                );

                await companyBox.put('informasiPerusahaan', companyInfo);
                Get.back();
                snackBar('Informasi Perusahaan berhasil disimpan',
                    SnackbarType.SUCCESS);
              },
              child: const Text(
                'Simpan',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      verticalSpace(20),
    ],
  );
}
