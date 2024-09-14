import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/profile_information/controllers/profile_information_controller.dart';

class StepperLine extends StatelessWidget {
  const StepperLine({
    super.key,
    required this.controller,
  });

  final ProfileInformationController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => EasyStepper(
          lineStyle: LineStyle(
            lineLength: 100,
            lineWidth: 20,
            activeLineColor: Colors.amber,
            finishedLineColor: Colors.amber,
            defaultLineColor: Colors.amber.withOpacity(0.5),
            lineThickness: 3,
            lineType: LineType.normal,
          ),
          activeStep: controller.currentStep.value,
          activeStepTextColor: Colors.amber,
          finishedStepTextColor: Colors.black87,
          internalPadding: 0,
          showLoadingAnimation: false,
          stepRadius: 20,
          showStepBorder: false,
          steps: [
            EasyStep(
              customStep: GestureDetector(
                onTap: () {
                  controller.currentStep.value = 0;
                },
                child: CircleAvatar(
                    backgroundColor: controller.currentStep.value >= 0
                        ? Colors.amber
                        : Colors.amber.withOpacity(0.2),
                    radius: 30,
                    child: const Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ),
              customTitle: const Text('Biodata Diri',
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                  textAlign: TextAlign.center),
            ),
            EasyStep(
              customStep: GestureDetector(
                onTap: () {
                  controller.currentStep.value = 1;
                },
                child: CircleAvatar(
                    backgroundColor: controller.currentStep.value >= 1
                        ? Colors.amber
                        : Colors.amber.withOpacity(0.2),
                    radius: 30,
                    child: const Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ),
              customTitle: const Text(
                'Alamat\nPribadi',
                style: TextStyle(
                  color: Colors.amber,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            EasyStep(
              customStep: GestureDetector(
                onTap: () {
                  controller.currentStep.value = 2;
                },
                child: CircleAvatar(
                  backgroundColor: controller.currentStep.value >= 2
                      ? Colors.amber
                      : Colors.amber.withOpacity(0.2),
                  radius: 30,
                  child: const Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              customTitle: const Text(
                'Informasi\nPerusahaan',
                style: TextStyle(
                  color: Colors.amber,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
          onStepReached: (index) {
            controller.currentStep.value = index;
          }),
    );
  }
}
