import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants.dart';
import '../../widgets/Custom_Icon.dart';
import '../../widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            child: Column(children: const [
              Text('FEB', style: TextStyle(fontSize: 16, color: Colors.grey)),
              Text(
                '11',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 6,
                ),
              ),
            ]),
          ),
          Expanded(
            child: SizedBox(
              height: 440,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VideoWidget(
                        vimg:
                            "https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/ouB7hwclG7QI3INoYJHaZL4vOaa.jpg"),
                    Row(
                      children: [
                        Text(
                          'TALL GIRL 2',
                          style: GoogleFonts.kaushanScript(
                            letterSpacing: -3,
                            fontSize: 40,
                          ),
                        ),
                        const Spacer(),
                        const CustomButtonWidget(
                          iconsize: 18,
                          textsize: 9,
                          icon: CupertinoIcons.bell,
                          title: 'Remind Me',
                        ),
                        kwidth,
                        const CustomButtonWidget(
                          iconsize: 18,
                          textsize: 9,
                          icon: CupertinoIcons.info,
                          title: 'Info',
                        ),
                        kwidth,
                      ],
                    ),
                    const Text('Coming on Friday'),
                    kheight,
                    Row(children: [
                      SizedBox(
                        height: 15,
                        width: 15,
                        child: Image.network(
                            "https://yt3.googleusercontent.com/ytc/AGIKgqNforBaV69eZApu-S8E8AA7gknUdRpYFxqslHf2-w=s900-c-k-c0x00ffffff-no-rj"),
                      ),
                      Text(
                        'FILM',
                        style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 10,
                            color: Colors.white.withOpacity(.5)),
                      )
                    ]),
                    const Text(
                      "Tall Girl 2",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    kheight,
                    const Text(
                      '''Landing the lead in the school musical is a\ndreamcometrue for Jodi,untile the pressure\nsends her confidens -and her relationship-\ninto tailspin.''',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
