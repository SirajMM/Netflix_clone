import 'package:flutter/material.dart';

class MainCard1 extends StatelessWidget {
  const MainCard1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 250,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://www.themoviedb.org/t/p/w220_and_h330_face/liLN69YgoovHVgmlHJ876PKi5Yi.jpg"))),
    );
  }
}
