import 'package:flutter/material.dart';

// ignore: camel_case_types
class iconeditprofile extends StatelessWidget {
  const iconeditprofile({
    super.key,
    required this.title,
    required this.icon,
    this.colorIcon,
    this.function,
  });
  final String title;
  final IconData icon;
  final Color? colorIcon;
  final Function()? function;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.amber,
              ),
            ),
            child: Icon(
              icon,
              color: colorIcon,
            ),
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
