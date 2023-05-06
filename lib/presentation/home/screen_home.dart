// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/home/home_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/home/widget/home_background_card.dart';
import 'package:netflix_clone/presentation/home/widget/numberwidget.dart';
import '../../core/constants.dart';
import '../widgets/maintitlecard.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPersistentFrameCallback((_) {
    // });
    BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (context, value, child) =>
            NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;

            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(
                        child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ));
                  }
                  //else if (state.isError) {
                  //   return const Center(
                  //       child: Text('Error while getting data'));
                  // }

                  // released past year
                  final _rleasePastYear = state.pastYearMovieList.map((m) {
                    return '$imageAppendUrl${m.posterPath}';
                  }).toList();
                  // trending
                  final _trending = state.trendingMoviesList.map((m) {
                    return '$imageAppendUrl${m.posterPath}';
                  }).toList();
                  // tense dramas
                  final _tenseDramas = state.tenseDramasMovieList.map((m) {
                    return '$imageAppendUrl${m.posterPath}';
                  }).toList();
                  // South Indian
                  final _southIndianMovies =
                      state.tenseDramasMovieList.map((m) {
                    return '$imageAppendUrl${m.posterPath}';
                  }).toList();
                  _southIndianMovies.shuffle();
                  // Top10 Tv shows
                  final _top10TvShows = state.trendingTvList.map((t) {
                    return '$imageAppendUrl${t.posterPath}';
                  }).toList();
                  _top10TvShows.shuffle();
                  print(state.trendingTvList.length);
                  return ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const HomeBackgroungCard(),
                      MainTitleCard(
                        title: 'Released in the past year',
                        posterList: _rleasePastYear,
                      ),
                      kheight,
                      MainTitleCard(
                        title: 'Trending Now',
                        posterList: _trending,
                      ),
                      kheight,
                      NumberTitleWidget(posterList: _top10TvShows),
                      kheight,
                      MainTitleCard(
                          title: 'Tense Dramas', posterList: _tenseDramas),
                      kheight,
                      MainTitleCard(
                          title: 'South Indian Cinema',
                          posterList: _southIndianMovies),
                    ],
                  );
                },
              ),
              scrollNotifier.value == true
                  ? AnimatedContainer(
                      duration: const Duration(seconds: 2),
                      width: double.infinity,
                      height: 100,
                      color: Colors.black.withOpacity(0.5),
                      child: Column(children: [
                        kheight,
                        Row(children: [
                          Image.asset(
                            'assets/images/netflixlogo.png',
                            width: 50,
                            height: 50,
                            fit: BoxFit.contain,
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.cast,
                            color: Colors.white,
                            size: 30,
                          ),
                          kwidth,
                          Container(
                            width: 30,
                            height: 30,
                            // color: Colors.blue,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/images/netflixappbarimg.jpg'))),
                          ),
                          kwidth
                        ]),
                        kheight,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'TV Shows',
                              style: khomeTextstile,
                            ),
                            Text(
                              'Movies',
                              style: khomeTextstile,
                            ),
                            Text(
                              'Categories',
                              style: khomeTextstile,
                            ),
                          ],
                        ),
                      ]),
                    )
                  : kheight
            ],
          ),
        ),
      ),
    );
  }
}
