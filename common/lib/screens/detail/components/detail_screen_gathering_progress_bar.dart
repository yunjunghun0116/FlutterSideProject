import 'package:flutter/material.dart';
import '../../../constants.dart';

class DetailScreenGatheringProgressBar extends StatelessWidget {
  final int participantCount;
  final int capacity;
  const DetailScreenGatheringProgressBar({
    Key? key,
    required this.participantCount,
    required this.capacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double subWidth = MediaQuery.of(context).size.width - 20;
    double mainWidth =
        subWidth * ((participantCount+1) / (capacity > 0 ? capacity+1 : 1));
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '참여 인원',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Text('${participantCount+1}/${capacity+1}명'),
            ],
          ),
          const SizedBox(height: 5),
          Stack(
            children: [
              Container(
                height: 20,
                width: subWidth,
                decoration: BoxDecoration(
                  color: kLightGreyColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                height: 20,
                width: mainWidth,
                decoration: BoxDecoration(
                  color: kYellowColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
