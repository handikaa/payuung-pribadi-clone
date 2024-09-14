import 'package:get/get.dart';

import '../../../data/dummy_data/data_apps.dart';
import '../../../data/model/service_model.dart';

class HomeController extends GetxController {
  RxString dropdownValue = 'Terpopuler'.obs;
  RxList<String> filter = [
    'Terpopuler',
    'A to Z',
    'Z to A',
    'Harga Terendah',
    'Harga Tertinggi',
  ].obs;

  RxList<WellnessModel> filteredWellness = RxList([]);

  void filterWellness() {
    switch (dropdownValue.value) {
      case 'A to Z':
        filteredWellness.value = wellness.obs.toList()
          ..sort((a, b) => a.name.compareTo(b.name));
        break;
      case 'Z to A':
        filteredWellness.value = wellness.obs.toList()
          ..sort((a, b) => b.name.compareTo(a.name));
        break;
      case 'Harga Terendah':
        filteredWellness.value = wellness.obs.toList()
          ..sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Harga Tertinggi':
        filteredWellness.value = wellness.obs.toList()
          ..sort((a, b) => b.price.compareTo(a.price));
        break;
      default:
        filteredWellness.value = wellness;
    }
  }

  @override
  void onInit() {
    super.onInit();
    filteredWellness.value = wellness;
    ever(dropdownValue, (_) => filterWellness());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
