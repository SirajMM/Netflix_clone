// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';

class SearchTitleText extends StatelessWidget {
  String titile;
  SearchTitleText({super.key, required this.titile});

  @override
  Widget build(BuildContext context) {
    return Text(
      titile,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
