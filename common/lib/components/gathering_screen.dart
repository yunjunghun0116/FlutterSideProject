import 'package:flutter/material.dart';
import 'gathering_card.dart';
import '../constants.dart';

class GatheringScreen extends StatelessWidget {
  final String title;
  final List gatheringList;
  const GatheringScreen({
    Key? key,
    required this.title,
    required this.gatheringList,
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
      body: ListView(
        children: gatheringList.map((gathering) {
          return GatheringCard(gathering: gathering);
        }).toList(),
      ),
    );
  }
}
