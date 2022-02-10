import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/controllers/gathering_controller.dart';
import 'package:common/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'gathering_card_info.dart';
import 'gathering_card_tag.dart';
import '../constants.dart';
import '../utils.dart';
import '../models/gathering.dart';
import '../screens/detail/detail_screen.dart';

class GatheringCard extends StatelessWidget {
  final Gathering gathering;
  final String userName;
  final String userImageUrl;
  final String userJob;
  final String gatheringTitle;
  final int gatheringParticipant;
  final int gatheringCapacity;
  final String gatheringOpenTime;
  final String gatheringEndTime;
  final String gatheringPlace;
  final List gatheringTagList;
  const GatheringCard({
    Key? key,
    required this.gathering,
    required this.userName,
    required this.userImageUrl,
    required this.userJob,
    required this.gatheringTitle,
    required this.gatheringParticipant,
    required this.gatheringCapacity,
    required this.gatheringOpenTime,
    required this.gatheringEndTime,
    required this.gatheringPlace,
    required this.gatheringTagList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _dates = getDateTime(gatheringOpenTime, gatheringEndTime);

    return GestureDetector(
      onTap: () async {
        Gathering _gathering =
            await GatheringController.to.getGathering(gathering.id);
        Get.to(() => DetailScreen(
              gathering: _gathering,
              isHost: gathering.host.userId == UserController.to.user!.id,
            ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: kLightGreyColor),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 80,
              child: Column(
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: userImageUrl,
                      placeholder: (context, url) => Container(
                        width: 80,
                        height: 80,
                        color: kLightGreyColor,
                      ),
                      errorWidget: (context, url, error) => Icon(error),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    userName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    userJob,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        gatheringTitle,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '인원 $gatheringParticipant/$gatheringCapacity',
                        style: TextStyle(
                          color: gatheringParticipant >= gatheringCapacity
                              ? kRedColor
                              : kBlueColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  GatheringCardInfo(
                    content: _dates[0],
                    icon: Icons.event_available,
                  ),
                  GatheringCardInfo(
                    content:
                        '${_dates[1]} / ${_dates.length == 2 ? '종료시간미정' : _dates[2]}',
                    icon: Icons.timer,
                  ),
                  GatheringCardInfo(
                    content: gatheringPlace,
                    icon: Icons.location_on_outlined,
                  ),
                  GatheringCardTag(
                    tagList: gatheringTagList,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
