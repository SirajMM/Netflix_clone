import 'package:flutter/material.dart';
import '../../core/constants.dart';
import 'main_title.dart';
import 'maincard.dart';

class MainTitleCard extends StatelessWidget {
  final String title;
  const MainTitleCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kheight,
        LimitedBox(
            maxHeight: 220,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) => const MainCard1(),
                separatorBuilder: (context, index) => kwidth,
                itemCount: 10))
      ],
    );
  }
}
