import 'package:common/controllers/post_controller.dart';
import 'package:common/models/post.dart';
import 'package:common/screens/community/components/community_screen_category_page_post_card.dart';
import 'package:common/screens/community/components/community_screen_post_upload_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class CommunityScreenCategoryPage extends StatelessWidget {
  final String category;
  const CommunityScreenCategoryPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 1,
        title: Text(category),
      ),
      body: GetBuilder<PostController>(
        builder: (_){
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: PostController.to.postList.map((Post post) {
                return CommunityScreenCategoryPagePostCard(post: post);
              }).toList(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => CommunityScreenPostUploadPage(category: category));
        },
        backgroundColor: kYellowColor,
        foregroundColor: kWhiteColor,
        child: Container(
          alignment: Alignment.center,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
