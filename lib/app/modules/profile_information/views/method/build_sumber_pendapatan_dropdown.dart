import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/profile_information_controller.dart';

Widget buildSumberPendapatanDropdown(
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
            value: controller.sumberPendapatanSelected.value.isEmpty
                ? null
                : controller.sumberPendapatanSelected.value,
            onChanged: (String? newValue) {
              controller.sumberPendapatanSelected.value = newValue ?? '';
            },
            items: controller.sumberPendapatanList
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
