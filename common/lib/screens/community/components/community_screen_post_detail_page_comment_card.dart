import 'package:common/controllers/post_controller.dart';
import 'package:common/controllers/user_controller.dart';
import 'package:common/models/comment.dart';
import 'package:common/models/post.dart';
import 'package:common/screens/community/components/community_screen_post_detail_page_recomment_card.dart';
import 'package:common/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class CommunityScreenPostDetailPageCommentCard extends StatelessWidget {
  final Post post;
  final Comment comment;
  final bool isRecomment;
  final int commentIndex;
  final int selectedIndex;
  final Function recommentPressed;
  final Function reportPressed;
  const CommunityScreenPostDetailPageCommentCard({
    Key? key,
    required this.post,
    required this.comment,
    required this.isRecomment,
    required this.commentIndex,
    required this.selectedIndex,
    required this.recommentPressed, required this.reportPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _recommentIndex = 0;
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
            children: [
              Text(
                comment.authorName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
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
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () async {
                  await checkDialog(
                    title: '댓글을 신고하시겠습니까?',
                    sureText: '신고하기',
                    onPressed: () async {
                      Get.back();
                      await PostController.to.reportComment(
                        postId: post.id,
                        commentIndex: commentIndex,
                      );
                      await getDialog(title: '댓글이 신고되었습니다');
                      reportPressed();
                    },
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
          Text(comment.comment),
          const SizedBox(height: 10),
          Text(getUploadTime(DateTime.parse(comment.timeStamp))),
          comment.recommentList.isNotEmpty
              ? Column(
                  children: comment.recommentList.map((recomment) {
                    if (recomment.reportedList
                        .contains(UserController.to.user!.id)) {
                      return Container();
                    }
                    return CommunityScreenPostDetailPageRecommentCard(
                      post: post,
                      recomment: recomment,
                      commentIndex: commentIndex,
                      recommentIndex: _recommentIndex++,
                      reportPressed: reportPressed,
                    );
                  }).toList(),
                )
              : Container(),
        ],
      ),
    );
  }
}
