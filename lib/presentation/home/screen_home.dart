import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
              ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: const [
                  HomeBackgroungCard(),
                  MainTitleCard(title: 'Released in the past year'),
                  kheight,
                  MainTitleCard(title: 'Trending Now'),
                  kheight,
                  NumberTitleWidget(),
                  kheight,
                  MainTitleCard(title: 'Tense Dramas'),
                  kheight,
                  MainTitleCard(title: 'South Indian Cinema'),
                ],
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
