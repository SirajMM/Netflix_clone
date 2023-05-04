// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key,
      required this.icon,
      required this.title,
      this.iconsize = 25,
      this.textsize = 15});
  final IconData icon;
  final String title;
  final double iconsize;
  final double textsize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: iconsize,
        ),
        Text(
          title,
          style: TextStyle(fontSize: textsize),
        )
      ],
    );
  }
}
