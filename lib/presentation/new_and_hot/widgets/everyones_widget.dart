import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../widgets/Custom_Icon.dart';
import '../../widgets/video_widget.dart';

class EveryonesWathingWidget extends StatelessWidget {
  const EveryonesWathingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        const Text(
          "Friends",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        kheight,
        const Text(
          "This hit sitcom follows the merry misadventure of six\n20-somthing pals as they navigate the pitfalls of\nwork,life and love in 1990s Manhattan",
          style: TextStyle(color: Colors.grey),
        ),
        kheight50,
        const VideoWidget(
            vimg:
                "https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg"),
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