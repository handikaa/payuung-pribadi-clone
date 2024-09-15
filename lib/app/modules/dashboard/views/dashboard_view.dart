import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../method/space.dart';
import '../../chart/views/chart_view.dart';
import '../../home/views/home_view.dart';
import '../../search_page/views/search_page_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.selectedIndex.value,
            children: const [
              HomeView(),
              SearchPageView(),
              ChartView(),
            ],
          )),
      bottomNavigationBar: GetBuilder<DashboardController>(
        init: DashboardController(),
        builder: (controller) {
          return Obx(
            () => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: controller.height.value,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CustomPaint(
                        painter: SearchIconPainter(),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                          child: BottomNavigationBar(
                            backgroundColor: Colors.white,
                            currentIndex: controller.selectedIndex.value,
                            selectedItemColor: Colors.amber,
                            onTap: (value) => controller.changeIndex(value),
                            items: [
                              BottomNavigationBarItem(
                                icon: Column(
                                  children: [
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/home.svg',
                                      color: controller.selectedIndex.value == 0
                                          ? Colors.amber
                                          : Colors.grey,
                                    ),
                                  ],
                                ),
                                label: 'Beranda',
                              ),
                              BottomNavigationBarItem(
                                icon: Column(
                                  children: [
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/search.svg',
                                      color: controller.selectedIndex.value == 1
                                          ? Colors.amber
                                          : Colors.grey,
                                    ),
                                  ],
                                ),
                                label: 'Cari',
                              ),
                              BottomNavigationBarItem(
                                icon: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Column(
                                      children: [
                                        const SizedBox(
                                          height: 18,
                                        ),
                                        SvgPicture.asset(
                                          'assets/icons/cart.svg',
                                          color:
                                              controller.selectedIndex.value ==
                                                      2
                                                  ? Colors.amber
                                                  : Colors.grey,
                                        ),
                                      ],
                                    ),
                                    const Positioned(
                                      right: -10,
                                      top: 10,
                                      child: CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Colors.red,
                                        child: Text(
                                          '0',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                label: 'Keranjang',
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: -15,
                        left: MediaQuery.of(context).size.width / 2 - 20,
                        child: GestureDetector(
                          onPanUpdate: controller.onPanUpdate,
                          onTap: controller.toggleExpanded,
                          child: Icon(
                            controller.isExpanded.value
                                ? Icons.keyboard_arrow_down_rounded
                                : Icons.keyboard_arrow_up_rounded,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: controller.isExpanded.value,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width > 700 ? 90 : 25,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  SvgPicture.asset(
                                    'assets/icons/cart.svg',
                                  ),
                                  const Text(
                                    'Daftar Transaksi',
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  SvgPicture.asset(
                                    'assets/icons/cart.svg',
                                  ),
                                  const Text(
                                    'Daftar Transaksi',
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  SvgPicture.asset(
                                    'assets/icons/cart.svg',
                                  ),
                                  const Text(
                                    'Daftar Transaksi',
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                            ],
                          ),
                          verticalSpace(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  SvgPicture.asset(
                                    'assets/icons/cart.svg',
                                  ),
                                  const Text(
                                    'Daftar Transaksi',
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
