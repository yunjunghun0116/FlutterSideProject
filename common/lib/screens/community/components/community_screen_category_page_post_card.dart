import 'package:common/models/post.dart';
import 'package:common/screens/community/components/community_screen_post_detail_page.dart';
import 'package:common/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';

class CommunityScreenCategoryPagePostCard extends StatelessWidget {
  final Post post;
  const CommunityScreenCategoryPagePostCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => CommunityScreenPostDetailPage(post: post));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: kDarkGreyColor,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 5),
            Text(
              post.content,
              style: kCommunityTextStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${getUploadTime(DateTime.parse(post.timeStamp))} | ${post.authorName}',
                  style: kCommunityTextStyle,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.chat_outlined,
                      color: kDarkGreyColor,
                      size: 20,
                    ),
                    Text(
                      ' ${post.commentList.length}',
                      style: kCommunityTextStyle,
                    )
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
