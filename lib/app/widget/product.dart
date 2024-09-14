import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payung_pribadi/app/method/space.dart';

class Product extends StatelessWidget {
  final int index;
  final String icon;
  final String text;
  const Product({
    super.key,
    required this.icon,
    required this.text,
    required this.index,
  });

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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.ideographic,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                width: _sizeIcon(index),
                color: _colorByIndex(index),
              ),
              verticalSpace(10),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
