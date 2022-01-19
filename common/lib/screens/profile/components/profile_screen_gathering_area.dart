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
                      style: TextStyle(fontSize: 16, color: kDeepBlueColor),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: kDeepBlueColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Column(
          children: gatheringList
              .sublist(0, gatheringList.length > 3 ? 3 : gatheringList.length)
              .map((gathering) {
            return GatheringCard(
              gathering: gathering,
              userName: gathering.host.name,
              userImageUrl: gathering.host.imageUrl,
              userJob: gathering.host.job,
              gatheringTitle: gathering.title,
              gatheringParticipant: gathering.approvalList.length,
              gatheringCapacity: gathering.capacity,
              gatheringOpenTime: gathering.openTime,
              gatheringEndTime: gathering.endTime,
              gatheringPlace: gathering.locationDetail,
              gatheringTagList: gathering.tagList,
            );
          }).toList(),
        ),
      ],
    );
  }
}
