import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class CommunityScreenPostDetail extends StatelessWidget {
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
  const CommunityScreenPostDetail({
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: kUnSelectedColor,
              ),
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    boardTitle,
                    style: kTitleTextStyle,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    gameTitle,
                    style: kSubTitleTextStyle,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: kUnSelectedColor,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authorName,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    getDateRemoveYear(timeStamp),
                    style: const TextStyle(
                      fontSize: 12,
                      color: kTitleColor,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                content,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  kThumbUpIcon,
                  Text('$likeCount'),
                  const SizedBox(width: 5),
                  kCommentIcon,
                  Text('$likeCount'),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: kUnSelectedColor,
                    )
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(recommentList[0]['authorName']),
                    Text(recommentList[0]['title']),
                    Text(getDateRemoveYear(recommentList[0]['timeStamp'])),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
