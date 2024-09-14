import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../method/space.dart';
import '../../../widget/input_form.dart';
import '../../../widget/stepper_line.dart';
import '../controllers/profile_information_controller.dart';
import 'method/alamat_pribadi.dart';
import 'method/biodata_diri_page.dart';
import 'method/informasi_perusahaan.dart';

class ProfileInformationView extends GetView<ProfileInformationController> {
  const ProfileInformationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 246, 246),
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: const Color.fromARGB(255, 246, 246, 246),
        title: const Text(
          'Informasi Pribadi',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color.fromARGB(255, 246, 246, 246),
            leading: const SizedBox(),
            surfaceTintColor: const Color.fromARGB(255, 246, 246, 246),
            expandedHeight: 100,
            toolbarHeight: 100,
            pinned: true,
            flexibleSpace: StepperLine(controller: controller),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: [
                    verticalSpace(30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Obx(
                            () {
                              switch (controller.currentStep.value) {
                                case 0:
                                  return buildStepContent1(
                                      controller: controller, context: context);
                                case 1:
                                  return buildStepContent2(
                                      controller: controller);
                                case 2:
                                  return buildStepContent3(
                                      controller: controller);
                                default:
                                  return buildStepContent1(
                                      controller: controller, context: context);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Form newMethod(GlobalKey<FormState> formkey) {
    return Form(
        key: formkey,
        child: Column(
          children: [
            InputForm(
              controller: controller.namaLengkapC,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Bidang ini wajib diisi';
                }
                return '';
              },
            ),
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
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    controller.currentStep.value += 1;
                  } else {}
                },
                child: const Text(
                  'Selanjutnya',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ));
  }
}
