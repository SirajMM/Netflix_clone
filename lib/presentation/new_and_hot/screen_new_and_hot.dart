import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/everyones_widget.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_clone/presentation/widgets/Custom_Icon.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';
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
          body: TabBarView(children: [
            _buildComingSoon(),
            _buildEveryone(),
          ]),
        ),
      ),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => const ComingSoonWidget(),
      itemCount: 10,
    );
  }

  Widget _buildEveryone() {
    return ListView.builder(
      itemBuilder: (context, index) => const EveryonesWathingWidget(),
      itemCount: 10,
      shrinkWrap: true,
    );
  }
}
