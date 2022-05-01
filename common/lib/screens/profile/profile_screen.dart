import 'package:common/controllers/user_controller.dart';
import 'package:common/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils.dart';
import 'components/profile_screen_button_area.dart';
import 'components/profile_screen_gathering_area.dart';
import 'components/profile_screen_edit_screen.dart';
import '../../components/user_info.dart';
import '../../constants.dart';
import '../../models/user.dart';
import '../../components/gathering_screen.dart';

class ProfileScreen extends StatelessWidget {
  final User user;
  final bool isCommunity;
  const ProfileScreen({
    Key? key,
    required this.user,
    this.isCommunity = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                  onTap: () => launchUrl(Uri.parse(user.kakaoLinkUrl)),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: Image.asset(
                      'assets/images/kakaotalk_logo.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                )
              : Container(),
          const SizedBox(width: 10),
          user.id != UserController.to.user!.id
              ? InkWell(
                  onTap: () async {
                    await checkDialog(
                      title: '유저를 차단하시겠습니까?',
                      sureText: '차단하기',
                      onPressed: () async {
                        Get.back();
                        await UserController.to.blockUser(user.id);
                        await getDialog(title: '${user.name} 유저를 차단했습니다');
                        Get.offAll(
                            () => MainScreen(startIndex: isCommunity ? 2 : 0));
                      },
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.report,
                      color: kRedColor,
                    ),
                  ),
                )
              : Container(),
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
          GetBuilder<UserController>(
            builder: (_) {
              bool _isFollowed = UserController.to.user!.likeUser
                      .indexWhere((element) => element.id == user.id) !=
                  -1;
              return ProfileScreenButtonArea(
                userIsMe: UserController.to.user!.id == user.id,
                isFollowed: _isFollowed,
                followPressed: () async =>
                    await UserController.to.followUser(user),
                followedPressed: () async =>
                    await UserController.to.unfollowUser(user),
                editPressed: () async =>
                    await Get.to(() => ProfileScreenEditScreen(user: user)),
              );
            },
          ),
          const Divider(),
          ProfileScreenGatheringArea(
            status: '주최',
            userId: user.id,
            onPressed: () => Get.to(
              () => GatheringScreen(
                title: '주최한 하루모임',
                status: '주최',
                userId: user.id,
              ),
            ),
          ),

          ProfileScreenGatheringArea(
            status: '참여',
            userId: user.id,
            onPressed: () => Get.to(
              () => GatheringScreen(
                title: '게스트로 참여한 모임',
                status: '참여',
                userId: user.id,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
