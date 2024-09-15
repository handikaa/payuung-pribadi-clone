import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxInt selectedIndex = 0.obs;
  RxBool isExpanded = false.obs;
  RxDouble height = 85.0.obs;
  final double expandedHeight = 300.0;
  final double collapsedHeight = 85.0;

  void changeIndex(int index) {
    selectedIndex.value = index;
    update();
  }

  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;

    height.value = isExpanded.value ? expandedHeight : collapsedHeight;
    update();
  }

  void onPanUpdate(DragUpdateDetails details) {
    double newHeight = height.value - details.delta.dy;

    if (newHeight >= collapsedHeight && newHeight <= expandedHeight) {
      height.value = newHeight;
    }

    if (height.value > collapsedHeight + 100) {
      isExpanded.value = true;
    } else if (height.value < collapsedHeight + 100) {
      isExpanded.value = false;
    }

    update();
  }
}

class SearchIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final path = Path();
    double radius = 30.0;

    path.moveTo(0, radius);
    path.arcToPoint(Offset(radius, 0),
        radius: Radius.circular(radius), clockwise: false);

    path.lineTo(size.width * 0.4, 0);
    path.quadraticBezierTo(size.width * 0.5, -30, size.width * 0.6, 0);
    path.lineTo(size.width - radius, 0);
    path.arcToPoint(Offset(size.width, radius),
        radius: Radius.circular(radius), clockwise: false);

    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);

    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
