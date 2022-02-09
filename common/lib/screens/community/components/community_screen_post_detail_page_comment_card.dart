import 'package:common/models/comment.dart';
import 'package:common/models/recomment.dart';
import 'package:common/screens/community/components/community_screen_post_detail_page_recomment_card.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CommunityScreenPostDetailPageCommentCard extends StatelessWidget {
  final Comment comment;
  final bool isRecomment;
  final int commentIndex;
  final int selectedIndex;
  final Function recommentPressed;
  const CommunityScreenPostDetailPageCommentCard({
    Key? key,
    required this.comment,
    required this.isRecomment,
    required this.commentIndex,
    required this.selectedIndex,
    required this.recommentPressed,
  }) : super(key: key);

  Widget _getRecommentList(List<Recomment> recommentList) {
    return Container();
  }

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
              GestureDetector(
                onTap: () {
                  recommentPressed();
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: selectedIndex == commentIndex
                        ? kGreyColor
                        : kLightGreyColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.comment_outlined,
                    size: 15,
                  ),
                ),
              ),
            ],
          ),
          Text(comment.comment),
          Text(comment.timeStamp),
          comment.recommentList.isNotEmpty
              ? Column(
                  children: comment.recommentList.map((Recomment recomment) {
                    return CommunityScreenPostDetailPageRecommentCard(
                        recomment: recomment);
                  }).toList(),
                )
              : Container(),
        ],
      ),
    );
  }
}
