import 'package:flutter/material.dart';

import '../../../../method/space.dart';
import '../../../../widget/header_service.dart';

Widget category() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Kategori Pilihan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                children: [
                  const Text('Wishlist'),
                  horizontalSpace(10),
                  const CircleAvatar(
                    backgroundColor: Colors.amber,
                    radius: 11,
                    child: Text(
                      '0',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
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
                      iconName: 'hobi',
                      text: 'Hobi',
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: HeaderService(
                      iconName: 'merch',
                      text: 'Merchandise',
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: HeaderService(
                      iconName: 'life style',
                      text: 'Gaya Hidup\n Sehat',
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: HeaderService(
                      iconName: 'chat',
                      width: 35,
                      text: 'Konseling &\n Rohani',
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
                    child: HeaderService(
                      iconName: 'brain',
                      text: 'Self\nDevelopment',
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: HeaderService(
                      iconName: 'money',
                      text: 'Perencanaan\nKeuangan',
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: HeaderService(
                      iconName: 'medical',
                      text: 'Konsultasi\nMedis',
                      width: 35,
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: HeaderService(
                      color: Colors.red,
                      iconName: 'see all',
                      width: 35,
                      text: 'Lihat Semua',
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
