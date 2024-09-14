import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/dummy_data/data_apps.dart';
import '../../../method/space.dart';
import '../controllers/home_controller.dart';
import 'method/category.dart';
import 'method/explore_wellness.dart';
import 'method/prduct.dart';
import 'method/user_info.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (context) {
          return Scaffold(
              backgroundColor: Colors.amber,
              appBar: AppBar(
                toolbarHeight: 80,
                forceMaterialTransparency: true,
                backgroundColor: Colors.amber,
                title: userInfo(),
              ),
              body: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 30),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          product(),
                          verticalSpace(30),
                          category(),
                          verticalSpace(30),
                          ...exploreWellness(
                              controller: controller, wellness: wellness),
                          verticalSpace(50),
                        ],
                      ),
                    ),
                  ),
                ],
              ));
        });
  }
}
