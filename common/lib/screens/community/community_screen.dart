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
          children: kCommunityCategoryList.map((Map<String, dynamic> category) {
            return CommunityScreenCategoryCard(
              icon: category['icon'],
              color: category['color'],
              title: category['title'],
              onPressed: () async {
                Get.to(() =>
                    CommunityScreenCategoryPage(category: category['title']));
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
