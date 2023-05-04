import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/presentation/search/widget/titile.dart';
import '../../../application/search/search_bloc.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';

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
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.isError) {
                  return const Center(
                    child: Text('Error Occured'),
                  );
                } else if (state.idealList.isEmpty) {
                  return const Center(
                    child: Text('No items found'),
                  );
                }
                return ListView.separated(
                  itemBuilder: (context, index) {
                    final movie = state.idealList[index];
                    return TopSearchItemtile(
                        title: movie.title ?? 'No Titile Provided',
                        imageUrl: '$imageAppendUrl${movie.posterPath}');
                  },
                  separatorBuilder: (context, index) => kheight20,
                  itemCount: state.idealList.length,
                  shrinkWrap: true,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class TopSearchItemtile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchItemtile(
      {super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: size * 0.33,
          height: 75,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover)),
        ),
        kwidth,
        Expanded(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
