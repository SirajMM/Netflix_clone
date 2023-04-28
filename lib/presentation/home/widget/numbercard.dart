import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class NumberCard extends StatelessWidget {
  final int index;
  const NumberCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              height: 250,
              width: 30,
            ),
            Container(
              // height: 250,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://www.themoviedb.org/t/p/w220_and_h330_face/wDWwtvkRRlgTiUr6TyLSMX8FCuZ.jpg"),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 3,
          bottom: -35,
          child: BorderedText(
            strokeWidth: 5.0,
            strokeColor: kwhitecolor,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                color: kblackcolor,
                fontSize: 120,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
