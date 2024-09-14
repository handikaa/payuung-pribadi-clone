import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../method/space.dart';
import '../../../../routes/app_pages.dart';

Widget userInfo() => Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              greetingText(),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const Text(
              'Admin',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const Spacer(),
        const Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(
              Icons.notifications,
              size: 30,
              color: Colors.white,
            ),
            Positioned(
              right: -5,
              top: -5,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.red,
                child: Text(
                  '0',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
        horizontalSpace(20),
        GestureDetector(
          onTap: () => Get.toNamed(Routes.PROFILE),
          child: const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey,
          ),
        )
      ],
    );

String greetingText() {
  var hour = DateTime.now().hour;

  if (hour < 12) {
    return 'Selamat Pagi';
  } else if (hour < 18) {
    return 'Selamat Siang';
  } else {
    return 'Selamat Malam';
  }
}
