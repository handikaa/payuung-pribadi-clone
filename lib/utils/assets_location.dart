import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssetsLocation {
  static String iconPath = 'assets/icons/';
  static String imagePath = 'assets/images/';

  String imageLocation(String imageName) => '$imagePath$imageName.jpg';

  static Widget svgIconLocation(String iconNammed,
      {double? width, double? height, Color? color}) {
    return SvgPicture.asset(
      '$iconPath$iconNammed.svg',
      width: width,
      height: height,
      color: color,
    );
  }
}
