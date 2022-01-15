import 'package:camerpt/screens/community/components/community_screen_post_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';

class CommunityScreenPostCard extends StatelessWidget {
  final String gameTitle;
  final String boardTitle;
  final String postId;
  final String title;
  final String content;
  final String timeStamp;
  final String authorId;
  final String authorName;
  final int likeCount;
  final List<Map<String, dynamic>> recommentList;
  const CommunityScreenPostCard({
    Key? key,
    required this.gameTitle,
    required this.boardTitle,
    required this.postId,
    required this.title,
    required this.content,
    required this.timeStamp,
    required this.authorId,
    required this.authorName,
    required this.likeCount,
    required this.recommentList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => CommunityScreenPostDetail(
              gameTitle: gameTitle,
              boardTitle: boardTitle,
              postId: postId,
              title: title,
              content: content,
              timeStamp: timeStamp,
              authorId: authorId,
              authorName: authorName,
              likeCount: likeCount,
              recommentList: recommentList,
            ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: kUnSelectedColor,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: kPostOverviewTitleTextStyle,
              maxLines: 1,
              overflow: TextOverflow.visible,
            ),
            Text(
              content,
              style: kPostOverviewContentTextStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${getTimeDifference(timeStamp)} | $authorName',
                  style: kPostOverviewContentTextStyle,
                ),
                Row(
                  children: [
                    kThumbUpIcon,
                    Text('$likeCount'),
                    const SizedBox(width: 5),
                    kCommentIcon,
                    Text('${recommentList.length}'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
