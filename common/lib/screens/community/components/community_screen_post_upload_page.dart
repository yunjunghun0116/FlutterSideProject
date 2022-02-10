import 'package:common/controllers/post_controller.dart';
import 'package:common/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class CommunityScreenPostUploadPage extends StatelessWidget {
  final String category;
  CommunityScreenPostUploadPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 1,
        title: const Text('글쓰기'),
        actions: [
          GestureDetector(
            onTap: () async {
              //TODO 업로드하는함수 작성
              bool upload = await PostController.to.makePost(
                  category, _titleController.text, _contentController.text);
              if (upload) {
                await getDialog('글을 올리셨습니다.');
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
              child: const Text(
                '완료',
                style: TextStyle(
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
