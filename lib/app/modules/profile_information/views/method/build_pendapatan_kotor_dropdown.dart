import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/profile_information_controller.dart';

Widget buildPendapatanKotor(
    {required ProfileInformationController controller}) {
  return Obx(() => Container(
        width: Get.width,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: const Text(
              'Pilih',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            value: controller.pendapatanKotorSelected.value.isEmpty
                ? null
                : controller.pendapatanKotorSelected.value,
            onChanged: (String? newValue) {
              controller.pendapatanKotorSelected.value = newValue ?? '';
            },
            items: controller.pendapatanKotorList
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
              );
            }).toList(),
          ),
        ),
      ));
}
