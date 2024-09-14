import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../../../utils/helper.dart';
import '../../../../data/local_db/alamat_pribadi_local.dart';
import '../../../../method/space.dart';
import '../../../../widget/input_form.dart';
import '../../controllers/profile_information_controller.dart';
import 'build_city_dropdown.dart';
import 'build_kecamatan_dropdown.dart';
import 'build_kelurahan_dropdown.dart';
import 'province_dropdown.dart';

Widget buildStepContent2({
  required ProfileInformationController controller,
}) {
  controller.loadAlamatPribadi();
  final formKey = GlobalKey<FormState>();
  return Form(
    key: formKey,
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: GetBuilder<ProfileInformationController>(
              init: ProfileInformationController(),
              builder: (c) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        c.showBottomsheet();
                      },
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/card-id.svg',
                              width: 30,
                            ),
                          ),
                          horizontalSpace(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Upload KTP'),
                              if (c.image != null)
                                Text('foto-ktp-${Random().nextInt(10000)}.jpg'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(20),
                    Row(
                      children: [
                        const Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        ),
                        horizontalSpace(5),
                        const Text(
                          'NIK',
                        ),
                      ],
                    ),
                    verticalSpace(10),
                    InputForm(
                      controller: controller.nikC,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Kolom ini wajib diisi';
                        }
                        return null;
                      },
                    ),
                  ],
                );
              }),
        ),
        verticalSpace(20),
        Row(
          children: [
            const Text(
              '*',
              style: TextStyle(color: Colors.red),
            ),
            horizontalSpace(5),
            const Text(
              'ALAMAT SESUAI KTP',
            ),
          ],
        ),
        verticalSpace(10),
        InputForm(
          controller: controller.alamatSesuaiKTP,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Kolom ini wajib diisi';
            }
            return null;
          },
        ),
        verticalSpace(20),
        Row(
          children: [
            const Text(
              '*',
              style: TextStyle(color: Colors.red),
            ),
            horizontalSpace(5),
            const Text(
              'PROVINSI',
            ),
          ],
        ),
        verticalSpace(10),
        buildProvinceDropdown(
          controller: controller,
          selectedItem: controller.provinceSelected,
        ),
        verticalSpace(20),
        Row(
          children: [
            const Text(
              '*',
              style: TextStyle(color: Colors.red),
            ),
            horizontalSpace(5),
            const Text(
              'KOTA/KABUPATEN',
            ),
          ],
        ),
        verticalSpace(10),
        buildCityDropdown(
            controller: controller,
            selectedItem: controller.citySelected,
            previousItem: controller.provinceSelected),
        verticalSpace(20),
        Row(
          children: [
            const Text(
              '*',
              style: TextStyle(color: Colors.red),
            ),
            horizontalSpace(5),
            const Text(
              'KECAMATAN',
            ),
          ],
        ),
        verticalSpace(10),
        buildKecamatanDropdown(
            controller: controller,
            selectedItem: controller.kecamatanSelected,
            previousItem: controller.citySelected),
        verticalSpace(20),
        Row(
          children: [
            const Text(
              '*',
              style: TextStyle(color: Colors.red),
            ),
            horizontalSpace(5),
            const Text(
              'KELURAHAN',
            ),
          ],
        ),
        verticalSpace(10),
        buildKelurahanDropdown(
            controller: controller,
            selectedItem: controller.kelurahanSelected,
            previousItem: controller.kecamatanSelected),
        verticalSpace(20),
        Row(
          children: [
            const Text(
              '*',
              style: TextStyle(color: Colors.red),
            ),
            horizontalSpace(5),
            const Text(
              'KODE POS',
            ),
          ],
        ),
        verticalSpace(10),
        InputForm(
          controller: controller.kodePos,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Kolom ini wajib diisi';
            }
            return null;
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Obx(() => CheckboxListTile(
                    contentPadding: const EdgeInsets.all(0),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: controller.isSelected.value,
                    onChanged: (_) {
                      controller.isSelected.value =
                          !controller.isSelected.value;
                    },
                    title: const Text('Alamat domisili sama dengan alamat KTP'),
                  )),
            ),
          ],
        ),
        Obx(
          () {
            if (!controller.isSelected.value) {
              return Column(
                children: [
                  verticalSpace(20),
                  Row(
                    children: [
                      const Text(
                        '*',
                        style: TextStyle(color: Colors.red),
                      ),
                      horizontalSpace(5),
                      const Text(
                        'ALAMAT DOMISILI',
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  InputForm(
                    controller: controller.isSelected.value == true
                        ? controller.alamatSesuaiKTP
                        : controller.alamatDomisili,
                  ),
                  verticalSpace(20),
                  Row(
                    children: [
                      const Text(
                        '*',
                        style: TextStyle(color: Colors.red),
                      ),
                      horizontalSpace(5),
                      const Text(
                        'PROVINSI',
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  // untuk domisili
                  buildProvinceDropdown(
                      controller: controller,
                      selectedItem: controller.provinceSelectedDomisili),
                  verticalSpace(20),
                  Row(
                    children: [
                      const Text(
                        '*',
                        style: TextStyle(color: Colors.red),
                      ),
                      horizontalSpace(5),
                      const Text(
                        'KOTA/KABUPATEN',
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  // untuk domisili
                  buildCityDropdown(
                      controller: controller,
                      selectedItem: controller.citySelectedDomisili,
                      previousItem: controller.provinceSelectedDomisili),
                  verticalSpace(20),
                  Row(
                    children: [
                      const Text(
                        '*',
                        style: TextStyle(color: Colors.red),
                      ),
                      horizontalSpace(5),
                      const Text(
                        'KECAMATAN',
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  // untuk domisili
                  buildKecamatanDropdown(
                      controller: controller,
                      selectedItem: controller.kecamatanSelectedDomisili,
                      previousItem: controller.citySelectedDomisili),
                  verticalSpace(20),
                  Row(
                    children: [
                      const Text(
                        '*',
                        style: TextStyle(color: Colors.red),
                      ),
                      horizontalSpace(5),
                      const Text(
                        'KELURAHAN',
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  //untuk domisili
                  buildKelurahanDropdown(
                    controller: controller,
                    selectedItem: controller.kelurahanSelectedDomisili,
                    previousItem: controller.kecamatanSelectedDomisili,
                  ),
                  verticalSpace(20),
                  Row(
                    children: [
                      const Text(
                        '*',
                        style: TextStyle(color: Colors.red),
                      ),
                      horizontalSpace(5),
                      const Text(
                        'KODE POS',
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  InputForm(
                    controller: controller.kodePosDomisili,
                  ),
                  verticalSpace(20),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
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
                  if (formKey.currentState!.validate()) {
                    var profileBox = Hive.box<AlamatPribadi>('alamatBox');

                    final profile = AlamatPribadi(
                      nik: controller.nikC.text,
                      alamatSesuaiKTP: controller.alamatSesuaiKTP.text,
                      provinceSelectedKTP: controller.provinceSelected.value,
                      citySelectedKTP: controller.citySelected.value,
                      kecamatanSelectedKTP: controller.kecamatanSelected.value,
                      kelurahanSelectedKTP: controller.kelurahanSelected.value,
                      kodePosKTP: controller.kodePos.text,
                      alamatDomisili: controller.isSelected.value == true
                          ? controller.alamatSesuaiKTP.text
                          : controller.alamatDomisili.text,
                      provinceSelectedDomisili:
                          controller.isSelected.value == true
                              ? controller.provinceSelected.value
                              : controller.provinceSelectedDomisili.value,
                      citySelectedDomisili: controller.isSelected.value == true
                          ? controller.citySelected.value
                          : controller.citySelectedDomisili.value,
                      kecamatanSelectedDomisili:
                          controller.isSelected.value == true
                              ? controller.kecamatanSelected.value
                              : controller.kecamatanSelected.value,
                      kelurahanSelectedDomisili:
                          controller.isSelected.value == true
                              ? controller.kelurahanSelected.value
                              : controller.kelurahanSelected.value,
                      kodePosDomisili: controller.isSelected.value == true
                          ? controller.kodePos.text
                          : controller.kodePosDomisili.text,
                    );

                    await profileBox.put('alamat', profile);
                    snackBar('Alamat Pribadi berhasil disimpan',
                        SnackbarType.SUCCESS);
                    controller.currentStep.value += 1;
                  }
                },
                child: const Text(
                  'Selanjutnya',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        verticalSpace(20),
      ],
    ),
  );
}
