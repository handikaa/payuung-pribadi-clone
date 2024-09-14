import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hive/hive.dart';

import '../../../../../utils/helper.dart';
import '../../../../data/local_db/local_profile.dart';
import '../../../../method/space.dart';
import '../../../../widget/input_form.dart';
import '../../controllers/profile_information_controller.dart';
import 'gender_dropdown.dart';
import 'pendidikan_dropdown.dart';
import 'status_pernikahan_dropdown.dart';

Widget buildStepContent1({
  required ProfileInformationController controller,
  required BuildContext context,
}) {
  controller.loadProfileInformation();
  final formKey = GlobalKey<FormState>();

  return Form(
    key: formKey,
    child: Column(
      children: [
        Row(
          children: [
            const Text(
              '*',
              style: TextStyle(color: Colors.red),
            ),
            horizontalSpace(5),
            const Text(
              'NAMA LENGKAP',
            ),
          ],
        ),
        verticalSpace(10),
        InputForm(
          controller: controller.namaLengkapC,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Bidang ini wajib diisi';
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
              'TANGGAL LAHIR',
            ),
          ],
        ),
        verticalSpace(10),
        Obx(
          () => TextFormField(
            readOnly: true,
            onTap: () {
              controller.selectDate(context);
            },
            decoration: InputDecoration(
              hintText: controller.selectedDate.value.isEmpty
                  ? 'Select Date'
                  : controller.selectedDate.value,
              hintStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              filled: true,
              fillColor: Colors.transparent,
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.all(10),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              suffixIcon: const Icon(
                Icons.calendar_today,
                color: Colors.grey,
              ),
            ),
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
              'JENIS KELAMIN',
            ),
          ],
        ),
        verticalSpace(10),
        buildJenisKelaminDrowpDown(controller: controller),
        verticalSpace(20),
        Row(
          children: [
            const Text(
              '*',
              style: TextStyle(color: Colors.red),
            ),
            horizontalSpace(5),
            const Text(
              'ALAMAT EMAIL',
            ),
          ],
        ),
        verticalSpace(10),
        InputForm(
          keyboardType: TextInputType.emailAddress,
          controller: controller.emailC,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Bidang ini wajib diisi';
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
              'NO. HP',
            ),
          ],
        ),
        verticalSpace(10),
        InputForm(
          keyboardType: TextInputType.number,
          controller: controller.noHpC,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Bidang ini wajib diisi';
            }
            return null;
          },
        ),
        verticalSpace(20),
        Row(
          children: [
            horizontalSpace(5),
            const Text(
              'PENDIDIKAN',
            ),
          ],
        ),
        verticalSpace(10),
        buildPendidikanDropdown(controller: controller),
        verticalSpace(20),
        horizontalSpace(5),
        const Row(
          children: [
            Text(
              'STATUS PERNIKAHAN',
            ),
          ],
        ),
        verticalSpace(10),
        buildStatusPernikahanDropdown(controller: controller),
        verticalSpace(20),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                var profileBox = Hive.box<ProfileInformation>('profileBox');

                final profile = ProfileInformation(
                  namaLengkap: controller.namaLengkapC.text,
                  email: controller.emailC.text,
                  noHp: controller.noHpC.text,
                  selectedDate: controller.selectedDate.value,
                  genderSelected: controller.genderSelected.value,
                  pendidikanSelected: controller.pendidikanSelected.value,
                  statusPernikahanSelected:
                      controller.statusPernikahanSelected.value,
                );

                await profileBox.put('profile', profile);
                controller.currentStep.value += 1;
                snackBar('Biodata berhasil disimpan', SnackbarType.SUCCESS);
              }
            },
            child: const Text(
              'Selanjutnya',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        verticalSpace(20),
      ],
    ),
  );
}
