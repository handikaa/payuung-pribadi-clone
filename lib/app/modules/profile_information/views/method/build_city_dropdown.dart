import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/profile_information_controller.dart';

Widget buildCityDropdown({
  required ProfileInformationController controller,
  required RxString selectedItem,
  required RxString previousItem,
}) {
  return Obx(() => DropdownButtonFormField<String>(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.black),
          ),
          filled: previousItem.value.isEmpty,
          fillColor: previousItem.value.isEmpty ? Colors.grey[300] : null,
        ),
        hint: const Text(
          'Pilih',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        value: selectedItem.isEmpty ? null : selectedItem.value,
        onChanged: previousItem.value.isEmpty
            ? null
            : (String? newValue) {
                selectedItem.value = newValue ?? '';
              },
        validator: (value) {
          if (previousItem.value.isNotEmpty &&
              (value == null || value.isEmpty)) {
            return 'Kolom ini wajib diisi';
          }
          return null;
        },
        items:
            controller.cityList.map<DropdownMenuItem<String>>((String value) {
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
