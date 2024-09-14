import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../method/space.dart';
import '../../../../routes/app_pages.dart';

List<Widget> profileItem() {
  return [
    GestureDetector(
      onTap: () => Get.toNamed(Routes.PROFILE_INFORMATION),
      child: Container(
        padding: const EdgeInsets.all(5),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: SvgPicture.asset(
                'assets/icons/person.svg',
              ),
            ),
            horizontalSpace(10),
            const Text('Informasi Pribadi')
          ],
        ),
      ),
    )
  ];
}
