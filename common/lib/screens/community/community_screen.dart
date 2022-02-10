import 'package:common/controllers/post_controller.dart';
import 'package:common/screens/community/components/community_screen_category_card.dart';
import 'package:common/screens/community/components/community_screen_category_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        centerTitle: false,
        elevation: 1,
        title: const Text(
          '커뮤니티',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CommunityScreenCategoryCard(
              icon: Icons.coffee_outlined,
              color: kBlueColor,
              title: '자유게시판',
              onPressed: ()async {
                await PostController.to.setPostList('자유게시판');
                Get.to(() => const CommunityScreenCategoryPage(category: '자유게시판'));
              },
            ),
            CommunityScreenCategoryCard(
              icon: Icons.people_alt_outlined,
              color: kPinkColor,
              title: '친목게시판',
              onPressed: () async{
                await PostController.to.setPostList('친목게시판');
                Get.to(() => const CommunityScreenCategoryPage(category: '친목게시판'));
              },
            ),
            CommunityScreenCategoryCard(
              icon: Icons.dashboard_outlined,
              color: kYellowColor,
              title: '홍보게시판',
              onPressed: () async{
                await PostController.to.setPostList('홍보게시판');
                Get.to(() => const CommunityScreenCategoryPage(category: '홍보게시판'));
              },
            ),
            CommunityScreenCategoryCard(
              icon: Icons.masks_outlined,
              color: kGreenColor,
              title: '비밀게시판',
              onPressed: () async{
                await PostController.to.setPostList('비밀게시판');
                Get.to(() => const CommunityScreenCategoryPage(category: '비밀게시판'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
