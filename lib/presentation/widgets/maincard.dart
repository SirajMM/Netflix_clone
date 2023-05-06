import 'package:flutter/material.dart';

class MainCard1 extends StatelessWidget {
  String imageUrl;
  MainCard1({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 250,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(imageUrl))),
    );
  }
}
