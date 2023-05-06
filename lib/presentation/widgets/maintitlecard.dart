import 'package:flutter/material.dart';
import '../../core/constants.dart';
import 'main_title.dart';
import 'maincard.dart';

class MainTitleCard extends StatelessWidget {
  final String title;
  final List<String> posterList;
  const MainTitleCard({super.key, required this.title,required this.posterList});

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
                itemBuilder: (context, index) =>  MainCard1(imageUrl: posterList[index]),
                separatorBuilder: (context, index) => kwidth,
                itemCount: posterList.length))
      ],
    );
  }
}
