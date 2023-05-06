// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants.dart';
import '../../widgets/Custom_Icon.dart';
import '../../widgets/video_widget.dart';

class EveryonesWathingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String stringDescription;
  const EveryonesWathingWidget({
    Key? key,
    required this.posterPath,
    required this.movieName,
    required this.stringDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        Text(
          movieName,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        kheight,
        Text(
          stringDescription,
          style: const TextStyle(color: Colors.grey),
          maxLines: 4,
        ),
        kheight50,
        VideoWidget(url: posterPath),
        kheight20,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButtonWidget(
              iconsize: 25,
              textsize: 12,
              icon: Icons.share,
              title: 'Share',
            ),
            kwidth,
            CustomButtonWidget(
              iconsize: 25,
              textsize: 12,
              icon: CupertinoIcons.add,
              title: 'My List',
            ),
            kwidth,
            CustomButtonWidget(
              iconsize: 25,
              textsize: 12,
              icon: CupertinoIcons.play_arrow_solid,
              title: 'play',
            ),
            kwidth,
          ],
        )
      ],
    );
  }
}
