import 'package:common/controllers/post_controller.dart';
import 'package:common/models/post.dart';
import 'package:common/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class CommunityScreenPostUploadPage extends StatelessWidget {
  final String category;
  final Post? post;
  CommunityScreenPostUploadPage({
    Key? key,
    required this.category,
    this.post,
  }) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (post != null) {
      _titleController.text = post!.title;
      _contentController.text = post!.content;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 1,
        title: const Text('글쓰기'),
        actions: [
          GestureDetector(
            onTap: () async {
              if (post != null) {
                bool update = await PostController.to.updatePost(
                  postId: post!.id,
                  title: _titleController.text,
                  content: _contentController.text,
                );
                if (update) {
                  await getDialog(title: '글이 수정되었습니다');
                  Get.back();
                }
                return;
              }
              bool upload = await PostController.to.makePost(
                category: category,
                title: _titleController.text,
                content: _contentController.text,
              );
              if (upload) {
                await getDialog(title: '글을 올리셨습니다');
                Get.back();
              }
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: kBlueColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                post==null?'완료':'수정',
                style: const TextStyle(
                  color: kWhiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          padding: const EdgeInsets.all(16),
          color: kWhiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: const TextStyle(
                  fontSize: 14,
                  color: kGreyColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: '제목',
                  border: InputBorder.none,
                ),
              ),
              const Divider(
                color: kDarkGreyColor,
              ),
              Expanded(
                child: TextField(
                  controller: _contentController,
                  maxLines: 100,
                  decoration: const InputDecoration(
                    hintText: '내용을 입력하세요',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
