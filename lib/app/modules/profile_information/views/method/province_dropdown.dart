import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/profile_information_controller.dart';

Widget buildProvinceDropdown({
  required ProfileInformationController controller,
  required RxString selectedItem,
}) {
  return Obx(() => DropdownButtonFormField<String>(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ),
        hint: const Text(
          'Pilih',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        value: selectedItem.value.isEmpty ? null : selectedItem.value,
        onChanged: (String? newValue) {
          selectedItem.value = newValue ?? '';
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Kolom ini wajib diisi';
          }
          return null;
        },
        items: controller.provinceList
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          );
        }).toList(),
      ));
}
