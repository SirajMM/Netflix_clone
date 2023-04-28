import 'package:flutter/material.dart';

import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widget/titile.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        SearchTitleText(titile: 'Movies & TV'),
        kheight,
        Expanded(
            child: GridView.count(
          physics: const BouncingScrollPhysics(),
          crossAxisCount: 3,
          shrinkWrap: true,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.1 / 1.6,
          children: List.generate(20, (index) {
            return const MainCard();
          }),
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});
  final imageUrl1 =
      "https://www.themoviedb.org/t/p/w220_and_h330_face/1gDV0Lm9y8ufIKzyf0h0GBgb9Zj.jpg";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(imageUrl1))),
    );
  }
}
