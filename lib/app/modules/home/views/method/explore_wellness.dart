import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:payung_pribadi/app/method/space.dart';
import 'package:payung_pribadi/app/widget/wellness_card.dart';
import 'package:payung_pribadi/utils/toIdr_format.dart';

import '../../../../data/model/service_model.dart';
import '../../controllers/home_controller.dart';
import 'wellness_title.dart';

List<Widget> exploreWellness(
    {required HomeController controller,
    required List<WellnessModel> wellness}) {
  return [
    wellnessTitle(controller),
    verticalSpace(30),
    Obx(
      () => SizedBox(
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.filteredWellness.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 30,
          ),
          itemBuilder: (context, index) {
            final data = controller.filteredWellness[index];
            return WellnessCard(
              image: data.image,
              title: data.name,
              price: data.price.toIdrCurrencyFormat(),
            );
          },
        ),
      ),
    )
  ];
}
