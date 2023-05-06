// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
// import 'package:netflix_clone/presentation/new_and_hot/widgets/everyones_widget.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/everyones_widget.dart';
import '../../core/constants.dart';

class SreenNewAndHot extends StatelessWidget {
  const SreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Theme(
      data: theme.copyWith(
          colorScheme:
              theme.colorScheme.copyWith(surfaceVariant: Colors.transparent)),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              backgroundColor: kblackcolor,
              title: const Text(
                'New & Hot',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  color: Colors.white,
                ),
                kwidth,
                Container(
                  width: 26,
                  height: 26,
                  // color: Colors.blue,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'assets/images/netflixappbarimg.jpg'))),
                ),
                kwidth
              ],
              bottom: TabBar(
                  labelColor: kblackcolor,
                  unselectedLabelColor: kwhitecolor,
                  isScrollable: true,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  indicatorWeight: 0,
                  indicator: BoxDecoration(
                      color: kwhitecolor,
                      borderRadius: BorderRadius.circular(30)),
                  tabs: const [
                    Tab(
                        child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('🍿 Coming Soon'),
                    )),
                    Tab(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text("👀 Everyone's Watching"),
                      ),
                    )
                  ]),
            ),
          ),
          body: const TabBarView(children: [
            ComingSoonList(key: Key('coming_soon')),
            EveryoneIsWatchingList(key: Key('eveyone_is_wathing')),
          ]),
        ),
      ),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPersistentFrameCallback((_) {
    // });
    BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
              child: CircularProgressIndicator(
            strokeWidth: 2,
          ));
        } else if (state.isError) {
          return const Center(child: Text('Error Occured'));
        } else if (state.commingSoonList.isEmpty) {
          return const Center(child: Text('No videos Found'));
        } else {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final movie = state.commingSoonList[index];
              if (movie.id == null) {
                return const SizedBox();
              } else {
                String month = '';
                String date = '';
                try {
                  final _date = DateTime.tryParse(movie.releaseDate!);
                  final formatedDate =
                      DateFormat.yMMMMd('en_US').format(_date!);
                  month = formatedDate
                      .split(' ')
                      .first
                      .substring(0, 3)
                      .toUpperCase();
                  date = movie.releaseDate!.split('-')[1];
                } catch (_) {
                  month = '';
                  date = '';
                }

                return ComingSoonWidget(
                    id: movie.id.toString(),
                    month: month,
                    day: date,
                    posterPath: '$imageAppendUrl${movie.posterPath}',
                    movieName: movie.originalTitle ?? 'No Title',
                    stringDescription: movie.overview ?? 'No Description');
              }
            },
            itemCount: state.commingSoonList.length,
          );
        }
      },
    );
  }
}

class EveryoneIsWatchingList extends StatelessWidget {
  const EveryoneIsWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPersistentFrameCallback((_) {

    // });
    BlocProvider.of<HotAndNewBloc>(context)
        .add(const LoadDataInEveryoneIsWatching());
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
              child: CircularProgressIndicator(
            strokeWidth: 2,
          ));
        } else if (state.isError) {
          return const Center(child: Text('Error Occured'));
        } else if (state.everyoneIsWatchingList.isEmpty) {
          return const Center(child: Text('No videos Found'));
        } else {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              // final tv = state.everyoneIsWatchingList[index];

              final tv = state.everyoneIsWatchingList[index];
              return EveryonesWathingWidget(
                posterPath: '$imageAppendUrl${tv.posterPath}',
                movieName: tv.originalName ?? 'No name provided',
                stringDescription: tv.overview ?? 'No description',
              );
            },
            itemCount: state.commingSoonList.length,
          );
        }
      },
    );
  }
}
