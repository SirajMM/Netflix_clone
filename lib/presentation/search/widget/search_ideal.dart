import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/search/widget/titile.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/xZUZ9i6vVayjyhR1vRo9Bjku4h.jpg';

class SearchIdeal extends StatelessWidget {
  const SearchIdeal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kheight,
           SearchTitleText(titile: 'Top Searches'),
          kheight,
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => const TopSearchItemtile(),
              separatorBuilder: (context, index) => kheight20,
              itemCount: 10,
              shrinkWrap: true,
            ),
          )
        ],
      ),
    );
  }
}

class TopSearchItemtile extends StatelessWidget {
  const TopSearchItemtile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: size * 0.33,
          height: 75,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover)),
        ),
        kwidth,
        const Expanded(
          child: Text(
            'Movie Name',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const Icon(
          CupertinoIcons.play_circle,
          color: buttoncolorwhite,
          size: 35,
        )
      ],
    );
  }
}
