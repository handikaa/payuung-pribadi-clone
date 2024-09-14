import 'package:flutter/material.dart';

import '../../utils/assets_location.dart';
import '../method/space.dart';

class HeaderService extends StatelessWidget {
  const HeaderService({
    super.key,
    required this.iconName,
    required this.text,
    this.onTap,
    this.iconSIze = 40,
    this.color,
    this.width = 40,
  });

  final double width;
  final Color? color;
  final String iconName;
  final String text;
  final Function()? onTap;

  final double iconSIze;

  Color? _colorByIndex(int index) {
    switch (index) {
      case 0:
        return Colors.brown;

      case 2:
        return Colors.brown.withOpacity(0.5);

      case 4:
        return Colors.red;
      default:
        return null;
    }
  }

  double? _sizeIcon(int index) {
    switch (index) {
      case 0:
        return 50;

      case 3:
        return 50;
      case 4:
        return 40;
      default:
        return 30;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          AssetsLocation.svgIconLocation(
            iconName,
            width: width,
            color: color,
          ),
          verticalSpace(7),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
