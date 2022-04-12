import 'package:common/controllers/post_controller.dart';
import 'package:common/models/post.dart';
import 'package:common/models/recomment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../utils.dart';

class CommunityScreenPostDetailPageRecommentCard extends StatelessWidget {
  final Post post;
  final Recomment recomment;
  final int commentIndex;
  final int recommentIndex;
  final Function reportPressed;
  const CommunityScreenPostDetailPageRecommentCard({
    Key? key,
    required this.post,
    required this.recomment,
    required this.commentIndex,
    required this.recommentIndex, required this.reportPressed,
  }) : super(key: key);

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        recomment.authorName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await checkDialog(
                            title: '대댓글을 신고하시겠습니까?',
                            sureText: '신고하기',
                            onPressed: () async {
                              Get.back();
                              PostController.to.reportRecomment(
                                postId: post.id,
                                commentIndex: commentIndex,
                                recommentIndex: recommentIndex,
                              );
                              await getDialog(title: '대댓글이 신고되었습니다');
                              reportPressed();
                            },
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: kLightGreyColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Icon(
                            Icons.report,
                            size: 15,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(recomment.comment),
                  const SizedBox(height: 10),
                  Text(getUploadTime(DateTime.parse(recomment.timeStamp))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
