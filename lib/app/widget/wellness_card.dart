import 'package:flutter/material.dart';
import 'package:payung_pribadi/app/method/space.dart';

class WellnessCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  const WellnessCard(
      {super.key,
      required this.image,
      required this.title,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        verticalSpace(20),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
              ),
              verticalSpace(5),
              Text(
                price,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
