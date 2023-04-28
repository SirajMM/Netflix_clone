import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../widgets/Custom_Icon.dart';

class HomeBackgroungCard extends StatelessWidget {
  const HomeBackgroungCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 600,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(kmainImage),
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          // left: 0,
          // right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomButtonWidget(title: "My List", icon: Icons.add),
              const SizedBox(
                width: 60,
              ),
              _playButton(),
              const SizedBox(
                width: 60,
              ),
              const CustomButtonWidget(title: "info", icon: Icons.info_outline),
            ],
          ),
        ),
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
      style: ElevatedButton.styleFrom(
          backgroundColor: kwhitecolor,
          foregroundColor: kblackcolor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        size: 25,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Text(
          'Play',
          style: TextStyle(fontSize: 20, color: kblackcolor),
        ),
      ),
    );
  }
}
