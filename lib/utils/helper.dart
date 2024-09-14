import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

enum SnackbarType { SUCCESS, ERROR }

snackBar(String message, SnackbarType type) {
  Get.snackbar("$message", "",
      snackPosition: SnackPosition.TOP,
      backgroundColor: type == SnackbarType.SUCCESS ? Colors.green : Colors.red,
      borderRadius: 20,
      margin: EdgeInsets.all(15),
      colorText: Colors.white,
      duration: Duration(seconds: 4),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack);
}
