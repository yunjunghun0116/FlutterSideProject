import 'package:cached_network_image/cached_network_image.dart';
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
  const GatheringCard({
    Key? key,
    required this.gathering,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _dates = getDateTime(gathering.openTime, gathering.endTime);

    return GestureDetector(
      onTap: () async {
        Get.to(() => DetailScreen(
              gathering: gathering,
              isHost: gathering.host.userId == UserController.to.user!.id,
            ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 6),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: kLightGreyColor,
              width: 2,
            ),
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: gathering.host.imageUrl,
                        placeholder: (context, url) => Container(
                          width: 80,
                          height: 80,
                          color: kLightGreyColor,
                        ),
                        errorWidget: (context, url, error) => Center(
                          child: Icon(error),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    gathering.host.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    gathering.host.job,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
                      Expanded(
                        child: Text(
                          gathering.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      //TODO +1해주는 이유는 이 1은 주최자
                      Text(
                        '인원 ${gathering.approvalList.length + 1}/${gathering.capacity + 1}',
                        style: TextStyle(
                          color: gathering.approvalList.length >=
                                  gathering.capacity
                              ? kRedColor
                              : kMainColor,
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
                    icon: Icons.timer_outlined,
                  ),
                  GatheringCardInfo(
                    content: gathering.locationDetail,
                    icon: Icons.location_on_outlined,
                  ),
                  GatheringCardTag(
                    tagList: gathering.tagList,
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
