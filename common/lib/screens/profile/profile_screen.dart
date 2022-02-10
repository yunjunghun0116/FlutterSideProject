import 'package:common/controllers/database_controller.dart';
import 'package:common/controllers/gathering_controller.dart';
import 'package:common/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'components/profile_screen_button_area.dart';
import 'components/profile_screen_gathering_area.dart';
import 'components/profile_screen_edit_screen.dart';
import '../../components/user_info.dart';
import '../../constants.dart';
import '../../models/user.dart';
import '../../components/gathering_screen.dart';

class ProfileScreen extends StatelessWidget {
  final User user;
  const ProfileScreen({
    Key? key,
    required this.user,
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
        actions: [
          user.kakaoLinkUrl != ''
              ? GestureDetector(
                  onTap: () {
                    launch(user.kakaoLinkUrl);
                  },
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      'assets/images/kakaotalk_logo.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                )
              : Container(),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView(
        children: [
          UserInfo(
            userId: user.id,
            imageUrl: user.imageUrl,
            name: user.name,
            job: user.job,
            hostTagList: user.userTagList,
          ),
          GetBuilder<DatabaseController>(
            builder: (_) {
              bool _isFollowed = DatabaseController.to.user!.likeUser
                      .indexWhere((element) => element.id == user.id) !=
                  -1;
              return ProfileScreenButtonArea(
                userIsMe: DatabaseController.to.user!.id == user.id,
                isFollowed: _isFollowed,
                followPressed: () async {
                  await UserController.to.followUser(user);
                },
                followedPressed: () async {
                  await UserController.to.unfollowUser(user);
                },
                editPressed: () async {
                  await Get.to(() => ProfileScreenEditScreen(user: user));
                },
              );
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
            gatheringList: user.applyGatheringList,
            onPressed: () {
              Get.to(
                () => GatheringScreen(
                  title: '게스트로 참여한 모임',
                  gatheringList: user.applyGatheringList,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
