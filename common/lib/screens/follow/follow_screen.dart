import 'package:common/controllers/database_controller.dart';
import 'package:common/models/user.dart';
import 'package:common/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/follow_screen_card_button_area.dart';
import '../../components/user_info.dart';
import '../../constants.dart';

class FollowScreen extends StatelessWidget {
  final List followUserList;
  const FollowScreen({
    Key? key,
    required this.followUserList,
  }) : super(key: key);

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
          '팔로우',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        children: followUserList.map((user) {
          return Column(
            children: [
              UserInfo(
                userId: user.id,
                imageUrl: user.imageUrl,
                name: user.name,
                job: user.job,
                hostTagList: user.userTagList,
              ),
              FollowScreenCardButtonArea(
                chatPressed: () {},
                detailPressed: () async {
                  User _user = await DatabaseController.to.getUser(user.id);
                  bool _isFollowed = DatabaseController.to.user!.likeUser
                          .indexWhere((element) => element.id == user.id) !=
                      -1;
                  Get.to(
                    () => ProfileScreen(
                      currentUserId: _user.id,
                      user: _user,
                      isFollowed: _isFollowed,
                    ),
                  );
                },
              ),
              const Divider(),
            ],
          );
        }).toList(),
      ),
    );
  }
}
