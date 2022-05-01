import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../components/gathering_card.dart';
import '../../../constants.dart';
import '../../../controllers/gathering_controller.dart';
import '../../../models/gathering.dart';

class ProfileScreenGatheringArea extends StatelessWidget {
  final String status;
  final Function onPressed;
  final String userId;
  const ProfileScreenGatheringArea({
    Key? key,
    required this.onPressed,
    required this.status, required this.userId,
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
                  status == '주최' ? '주최한 하루모임' : '참여한 하루모임',
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
                        color: kMainColor,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: kMainColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        StreamBuilder(
          stream: status == '주최'
              ? GatheringController.to.getOpenGatheringListStream(userId)
              : GatheringController.to.getParticipateGatheringListStream(userId),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              QuerySnapshot _snapshot = snapshot.data;
              List<DocumentSnapshot> data = _snapshot.docs;
              if (data.isEmpty) {
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 100,
                      child: Text(
                        status == '주최'?'주최한 모임이 없습니다':'참여한 모임이 없습니다',
                        style: const TextStyle(
                          fontSize: 14,
                          color: kGreyColor,
                        ),
                      ),
                    ),
                    const Divider(),
                  ],
                );
              }
              return Column(
                children: data
                    .sublist(0, data.length > 2 ? 2 : data.length)
                    .map((gathering) {
                  return GatheringCard(
                    gathering: Gathering.fromJson({
                      'id':gathering.id,
                      ...gathering.data() as Map<String,dynamic>,
                    }),
                  );
                }).toList(),
              );
            } else {
              return Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 100,
                    child:  Text(
                      status == '주최'?'주최한 모임이 없습니다':'참여한 모임이 없습니다',
                      style: const TextStyle(
                        fontSize: 14,
                        color: kGreyColor,
                      ),
                    ),
                  ),
                  const Divider(),
                ],
              );
            }
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
