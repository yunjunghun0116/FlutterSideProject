import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/controllers/gathering_controller.dart';
import 'package:flutter/material.dart';
import '../models/gathering.dart';
import 'gathering_card.dart';
import '../constants.dart';

class GatheringScreen extends StatelessWidget {
  final String title;
  final String status; //주최 or 참여
  final String userId;
  const GatheringScreen({
    Key? key,
    required this.title,
    required this.status,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kGreyColor,
        elevation: 1,
        centerTitle: false,
        titleSpacing: 0,
        title: Text(
          title,
          style: const TextStyle(
            color: kBlackColor,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: status == '주최'
            ? GatheringController.to.getOpenGatheringListStream(userId)
            : GatheringController.to.getParticipateGatheringListStream(userId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            QuerySnapshot _snapshot = snapshot.data;
            List<DocumentSnapshot> data = _snapshot.docs;
            if (data.isEmpty) {
              return Center(
                child: Text(
                  status == '주최' ? '주최한 하루모임이 없습니다' : '참여한 하루모임이 없습니다',
                  style: const TextStyle(
                    color: kGreyColor,
                  ),
                ),
              );
            } else {
              return ListView(
                children: data.map((gathering) {
                  return GatheringCard(
                      gathering: Gathering.fromJson({
                    'id': gathering.id,
                    ...gathering.data() as Map<String, dynamic>
                  }));
                }).toList(),
              );
            }
          } else {
            return Center(
              child: Text(
                status == '주최' ? '주최한 하루모임이 없습니다' : '참여한 하루모임이 없습니다',
                style: const TextStyle(
                  color: kGreyColor,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
