import 'package:flutter/cupertino.dart';
import '../../../core/constants.dart';
import '../../widgets/main_title.dart';
import 'numbercard.dart';

class NumberTitleWidget extends StatelessWidget {
  final List<String> posterList;
  const NumberTitleWidget({super.key, required this.posterList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: 'Top 10 TV Shows in India Today'),
        kheight,
        LimitedBox(
            maxHeight: 240,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    NumberCard(index: index, imageUrl: posterList[index]),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 0,
                    ),
                itemCount: posterList.length))
      ],
    );
  }
}
