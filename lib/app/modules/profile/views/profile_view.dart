import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../method/space.dart';
import '../controllers/profile_controller.dart';
import 'method/profile_item.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 246, 246, 246),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          backgroundColor: const Color.fromARGB(255, 246, 246, 246),
          title: const Text(
            'Profile',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  verticalSpace(20),
                  ...profileItem(),
                ],
              ),
            ),
          ],
        ));
  }
}
