import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  final String url;
  const VideoWidget({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: Image.network(
            url,
            fit: BoxFit.cover,
            loadingBuilder: (_, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                  strokeWidth: 2,
                ));
              }
            },
            errorBuilder: (_, error, stackTrace) => const Center(
                child: Icon(
             CupertinoIcons.exclamationmark_circle,
              color: Colors.grey,
            )),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            radius: 17,
            backgroundColor: Colors.black.withOpacity(.5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off,
                color: kwhitecolor,
                size: 17,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
