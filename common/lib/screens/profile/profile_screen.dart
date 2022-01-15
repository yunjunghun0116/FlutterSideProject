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

class ProfileScreen extends StatefulWidget {
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
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          widget.user.name,
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
            userId: widget.user.id,
            imageUrl: widget.user.imageUrl,
            name: widget.user.name,
            job: widget.user.job,
            hostTagList: widget.user.userTagList,
          ),
          ProfileScreenButtonArea(
            userIsMe: widget.currentUserId == widget.user.id,
            //TODO 여기서 내가 팔로우한 유저인지 판단하기
            isFollowed: false,
            followPressed: () {},
            followedPressed: () {},
            editPressed: () async {
              await Get.to(() => ProfileScreenEditScreen(user: widget.user));
              setState(() {});
            },
          ),
          ProfileScreenGatheringArea(
            title: '호스트로 개최한 모임',
            gatheringList: widget.user.openGatheringList,
            onPressed: () {
              Get.to(
                () => GatheringScreen(
                  title: '호스트로 주최한 모임',
                  gatheringList: widget.user.openGatheringList,
                ),
              );
            },
          ),
          ProfileScreenGatheringArea(
            title: '게스트로 참여한 모임',
            gatheringList: widget.user.applyGatheringList,
            onPressed: () {
              Get.to(
                () => GatheringScreen(
                  title: '게스트로 참여한 모임',
                  gatheringList: widget.user.openGatheringList,
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: widget.currentUserId != widget.user.id
          ? ProfileScreenBottomBar(chatPressed: () {})
          : null,
    );
  }
}
