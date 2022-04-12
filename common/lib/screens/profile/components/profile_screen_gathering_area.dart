import 'package:flutter/material.dart';
import '../../../components/gathering_card.dart';
import '../../../constants.dart';

class ProfileScreenGatheringArea extends StatelessWidget {
  final String title;
  final List gatheringList;
  final Function onPressed;
  const ProfileScreenGatheringArea({
    Key? key,
    required this.title,
    required this.gatheringList,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onPressed();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: const [
                    Text(
                      '전체보기',
                      style: TextStyle(
                        fontSize: 16,
                        color: kBlueColor,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: kBlueColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Column(
          children: gatheringList
              .sublist(0, gatheringList.length > 2 ? 2 : gatheringList.length)
              .map((gathering) {
            return GatheringCard(
              gathering: gathering,
            );
          }).toList(),
        ),
      ],
    );
  }
}
