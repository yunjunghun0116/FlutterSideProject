import 'package:common/models/comment.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CommunityScreenPostDetailPageCommentCard extends StatelessWidget {
  final Comment comment;
  const CommunityScreenPostDetailPageCommentCard({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: kGreyColor,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                comment.authorName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: kLightGreyColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(
                  Icons.comment_outlined,
                  size: 15,
                ),
              ),
            ],
          ),
          Text(comment.comment),
          Text(comment.timeStamp),
        ],
      ),
    );
  }
}
