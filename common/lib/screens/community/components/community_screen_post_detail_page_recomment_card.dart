import 'package:common/models/recomment.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CommunityScreenPostDetailPageRecommentCard extends StatelessWidget {
  final Recomment recomment;
  const CommunityScreenPostDetailPageRecommentCard(
      {Key? key, required this.recomment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: const Icon(
              Icons.south_east,
              size: 20,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: kLightGreyColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recomment.authorName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(recomment.comment),
                  Text(recomment.timeStamp),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
