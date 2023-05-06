// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants.dart';
import '../../widgets/Custom_Icon.dart';
import '../../widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String stringDescription;
  const ComingSoonWidget({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.stringDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            child: Column(children: [
              Text(month,
                  style: const TextStyle(fontSize: 16, color: Colors.grey)),
              Text(
                day,
                style: const TextStyle(
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
                    // Video widget
                    VideoWidget(url: posterPath),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            movieName,
                            style: GoogleFonts.kaushanScript(
                              letterSpacing: -3,
                              fontSize: 30,
                            ),
                            overflow: TextOverflow.clip,
                            maxLines: 1,
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
                    Text('Coming on $day $month'),
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
                    Text(
                      movieName,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    kheight,
                    Text(
                      stringDescription,
                      style: const TextStyle(color: Colors.grey),
                      maxLines: 4,
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
