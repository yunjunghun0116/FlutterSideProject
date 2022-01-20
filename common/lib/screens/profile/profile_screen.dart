import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/profile_screen_button_area.dart';
import 'components/profile_screen_gathering_area.dart';
import 'components/profile_screen_bottom_bar.dart';
import 'components/profile_screen_edit_screen.dart';
import '../../components/user_info.dart';
import '../../constants.dart';
import '../../models/user.dart';
import '../../components/gathering_screen.dart';

class ProfileScreen extends StatelessWidget {
  final String currentUserId;
  final User user;
  final bool isFollowed;
  const ProfileScreen({
    Key? key,
    required this.currentUserId,
    required this.user,
    required this.isFollowed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kGreyColor,
        elevation: 1,
        centerTitle: false,
        titleSpacing: 0,
        title: Text(
          user.name,
          style: const TextStyle(
            color: kBlackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Center(
            child: Icon(Icons.share),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: ListView(
        children: [
          UserInfo(
            userId: user.id,
            imageUrl: user.imageUrl,
            name:user.name,
            job: user.job,
            hostTagList: user.userTagList,
          ),
          ProfileScreenButtonArea(
            userIsMe: currentUserId == user.id,
            isFollowed: isFollowed,
            followPressed: () {},
            followedPressed: () {},
            editPressed: () async {
              await Get.to(() => ProfileScreenEditScreen(user: user));
            },
          ),
          ProfileScreenGatheringArea(
            title: '호스트로 개최한 모임',
            gatheringList: user.openGatheringList,
            onPressed: () {
              Get.to(
                () => GatheringScreen(
                  title: '호스트로 주최한 모임',
                  gatheringList: user.openGatheringList,
                ),
              );
            },
          ),
          ProfileScreenGatheringArea(
            title: '게스트로 참여한 모임',
            gatheringList:user.applyGatheringList,
            onPressed: () {
              Get.to(
                () => GatheringScreen(
                  title: '게스트로 참여한 모임',
                  gatheringList: user.openGatheringList,
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: currentUserId != user.id
          ? ProfileScreenBottomBar(chatPressed: () {})
          : null,
    );
  }
}
