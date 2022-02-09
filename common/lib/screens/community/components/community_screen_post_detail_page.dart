import 'package:common/models/comment.dart';
import 'package:common/models/post.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CommunityScreenPostDetailPage extends StatefulWidget {
  final Post post;
  const CommunityScreenPostDetailPage({Key? key, required this.post})
      : super(key: key);

  @override
  State<CommunityScreenPostDetailPage> createState() =>
      _CommunityScreenPostDetailPageState();
}

class _CommunityScreenPostDetailPageState
    extends State<CommunityScreenPostDetailPage> {
  bool isRecomment = false;

  Widget _getCommentArea(List<Comment> commentList){
    return Column();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 1,
        title: Text(widget.post.category),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: kWhiteColor,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    widget.post.authorName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.post.timeStamp,
                    style: kCommunityTextStyle,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.post.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.post.content,
                    style: const TextStyle(
                      fontSize: 18,
                      color: kDarkGreyColor,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    height: 30,
                    color: kRedColor,
                  ),
                  Column(
                    children: widget.post.commentList.map((Comment comment) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: kGreyColor,
                        ))),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
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
                    }).toList(),
                  ),
                ],
              ),
            ),
            SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    color: kLightGreyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                    isRecomment ? '대댓글을 입력하세요' : '댓글을 입력하세요'),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Icon(
                          Icons.send_outlined,
                          color: kBlueColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
