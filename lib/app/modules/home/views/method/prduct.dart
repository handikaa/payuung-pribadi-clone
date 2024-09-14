import 'package:flutter/material.dart';

import '../../../../method/space.dart';
import '../../../../widget/header_service.dart';

Widget product() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Produk Keuangan',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        verticalSpace(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  Expanded(
                    child: HeaderService(
                      width: 50,
                      iconName: 'group',
                      color: Colors.brown,
                      text: 'Urun',
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: HeaderService(
                      iconName: 'kaaba',
                      text: 'Permbiayaan Porsi Haji',
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: HeaderService(
                      color: Colors.brown.shade400,
                      iconName: 'financial',
                      text: 'Financial\n Check Up',
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: HeaderService(
                      iconName: 'car',
                      text: 'Asuransi Mobil',
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              verticalSpace(20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  Expanded(
                    flex: 1,
                    child: HeaderService(
                      color: Colors.red,
                      iconName: 'house fire',
                      text: 'Asuransi\nProperti',
                      onTap: () {},
                    ),
                  ),
                  Expanded(flex: 3, child: Container()),
                ],
              ),
            ],
          ),
        ),
      ],
    );
