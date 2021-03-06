import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/controllers/post_controller.dart';
import 'package:common/controllers/user_controller.dart';
import 'package:common/models/comment.dart';
import 'package:common/models/post.dart';
import 'package:common/models/user.dart';
import 'package:common/screens/community/components/community_screen_post_detail_page_comment_card.dart';
import 'package:common/screens/community/components/community_screen_post_upload_page.dart';
import 'package:common/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../utils.dart';

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
      if (commentList[i].reportedList.contains(UserController.to.user!.id))
        continue;
      _commentList.add(
        CommunityScreenPostDetailPageCommentCard(
          post: widget.post,
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
              return;
            }
            if (isRecomment) {
              setState(() {
                selectedIndex = i;
              });
              return;
            }
            setState(() {
              isRecomment = true;
              selectedIndex = i;
            });
          },
          reportPressed: () {
            setState(() {
              isRecomment = false;
            });
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
    return StreamBuilder(
        stream: PostController.to.getPostStream(widget.post.id),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            Post post = Post.fromJson({
              'id': snapshot.data!.id,
              ...snapshot.data!.data() as Map<String, dynamic>,
            });
            return Scaffold(
              appBar: AppBar(
                backgroundColor: kWhiteColor,
                foregroundColor: kBlackColor,
                elevation: 1,
                title: Text(post.category),
                actions: [
                  post.authorId == UserController.to.user!.id
                      ? InkWell(
                          onTap: () => Get.to(() =>
                              CommunityScreenPostUploadPage(
                                  category: post.category, post: post)),
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: const Icon(
                              Icons.edit,
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () async {
                            await checkDialog(
                              title: '???????????? ?????????????????????????',
                              sureText: '????????????',
                              onPressed: () async {
                                Get.back();
                                await PostController.to.reportPost(
                                  postId: post.id,
                                  userId: UserController.to.user!.id,
                                );
                                await getDialog(title: '???????????? ?????????????????????');
                                Get.back();
                              },
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: const Icon(
                              Icons.report,
                              color: kRedColor,
                            ),
                          ),
                        )
                ],
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ListView(
                        children: [
                          const SizedBox(height: 24),
                          GestureDetector(
                            onTap: () async {
                              User user = await UserController.to
                                  .getUser(post.authorId);
                              Get.to(() =>
                                  ProfileScreen(user: user, isCommunity: true));
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: post.authorImageUrl != ''
                                          ? post.authorImageUrl
                                          : noPerson,
                                      placeholder: (context, url) => Container(
                                        width: 50,
                                        height: 50,
                                        color: kLightGreyColor,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: Image.asset(
                                          'assets/images/no_user.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      post.authorName,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      getUploadTime(
                                          DateTime.parse(post.timeStamp)),
                                      style: kCommunityTextStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            post.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            post.content,
                            style: const TextStyle(
                              fontSize: 18,
                              color: kDarkGreyColor,
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Divider(color: kDarkGreyColor, thickness: 1),
                          _getCommentArea(post.commentList),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 5,
                      left: 16,
                      right: 16,
                      bottom: MediaQuery.of(context).padding.bottom + 10,
                    ),
                    width: double.infinity,
                    decoration: kBottomBarDecoration,
                    child: Container(
                      decoration: BoxDecoration(
                        color: kLightGreyColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextField(
                                controller: _commentController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: isRecomment
                                        ? '???????????? ???????????????'
                                        : '????????? ???????????????'),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (isRecomment) {
                                bool upload =
                                    await PostController.to.uploadRecomment(
                                  postId: widget.post.id,
                                  category: widget.post.category,
                                  commentIndex: selectedIndex,
                                  comment: _commentController.text,
                                );
                                if (upload) {
                                  _commentController.clear();
                                  FocusScope.of(context).unfocus();
                                  setState(() {
                                    isRecomment = false;
                                    selectedIndex = -1;
                                  });
                                }
                                return;
                              }
                              bool upload =
                                  await PostController.to.uploadComment(
                                postId: widget.post.id,
                                category: widget.post.category,
                                comment: _commentController.text,
                              );
                              if (upload) {
                                _commentController.clear();
                                FocusScope.of(context).unfocus();
                              }
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: const Icon(
                                Icons.send_outlined,
                                color: kMainColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kWhiteColor,
              foregroundColor: kBlackColor,
              elevation: 1,
              title: Text(widget.post.category),
            ),
            body: const Center(
              child: Text(
                '???????????? ?????????\n???????????? ??????????????????!!',
                style: TextStyle(
                  fontSize: 24,
                  color: kGreyColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        });
  }
}
