import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';

Row wellnessTitle(HomeController controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Explore Wellness',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      Obx(
        () => Container(
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(100),
          ),
          child: DropdownButton<String>(
            value: controller.dropdownValue.value,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.black),
            dropdownColor: Colors.grey[300],
            underline: Container(),
            onChanged: (String? newValue) {
              controller.dropdownValue.value = newValue!;
            },
            items:
                controller.filter.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(value),
                    if (value == controller.dropdownValue.value)
                      const CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.amber,
                      ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    ],
  );
}
