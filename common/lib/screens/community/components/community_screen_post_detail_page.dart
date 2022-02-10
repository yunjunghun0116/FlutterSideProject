import 'package:common/controllers/database_controller.dart';
import 'package:common/controllers/post_controller.dart';
import 'package:common/models/comment.dart';
import 'package:common/models/post.dart';
import 'package:common/screens/community/components/community_screen_post_detail_page_comment_card.dart';
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

  final TextEditingController _commentController = TextEditingController();

  bool isRecomment = false;
  int selectedIndex = -1;

  Widget _getCommentArea(List commentList) {
    List<CommunityScreenPostDetailPageCommentCard> _commentList = [];
    for (int i = 0; i < commentList.length; i++) {
      _commentList.add(
        CommunityScreenPostDetailPageCommentCard(
          comment: commentList[i],
          isRecomment: isRecomment,
          commentIndex: i,
          selectedIndex: selectedIndex,
          recommentPressed: () {
            if (isRecomment && selectedIndex == i) {
              setState(() {
                isRecomment = false;
                selectedIndex = -1;
              });
              print(isRecomment);
              print(selectedIndex);
              return;
            }
            if (isRecomment) {
              setState(() {
                selectedIndex = i;
              });
              print(isRecomment);
              print(selectedIndex);
              return;
            }
            setState(() {
              isRecomment = true;
              selectedIndex = i;
            });
            print(isRecomment);
            print(selectedIndex);
          },
        ),
      );
    }
    return Column(
      children: _commentList,
    );
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
                  _getCommentArea(widget.post.commentList),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 5,
                bottom: MediaQuery.of(context).padding.bottom,
              ),
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
                          controller: _commentController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText:
                                  isRecomment ? '대댓글을 입력하세요' : '댓글을 입력하세요'),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: ()async{
                        print(_commentController.text);
                        if(isRecomment){
                          bool upload = await PostController.to.uploadRecomment(widget.post.id,selectedIndex, _commentController.text);
                          if(upload){
                            print('upload성공');
                          }
                          return;
                        }

                        bool upload = await PostController.to.uploadComment(widget.post.id, _commentController.text);
                        if(upload){
                          print('upload성공');
                        }
                        },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Icon(
                          Icons.send_outlined,
                          color: kBlueColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
