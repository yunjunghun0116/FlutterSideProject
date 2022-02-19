import 'package:common/controllers/user_controller.dart';
import 'package:common/models/user.dart';
import 'package:common/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/user_info.dart';
import '../../constants.dart';

class FollowScreen extends StatelessWidget {
  const FollowScreen({
    Key? key,
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
      body: GetBuilder<UserController>(
        builder: (_) {
          if (UserController.to.user!.likeUser.isEmpty) {
            return const Center(
              child: Text(
                '팔로우한 유저가 없네요ㅠㅠ\n다양한 유저들을 팔로우해보세요!!',
                style: TextStyle(
                  fontSize: 24,
                  color: kGreyColor,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }
          return ListView(
            children: UserController.to.user!.likeUser.map((user) {
              return Column(
                children: [
                  UserInfo(
                    userId: user.id,
                    imageUrl: user.imageUrl,
                    name: user.name,
                    job: user.job,
                    hostTagList: user.userTagList,
                  ),
                  GestureDetector(
                    onTap: () async {
                      User _user = await UserController.to.getUser(user.id);
                      Get.to(() => ProfileScreen(user: _user));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(10),
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kGreyColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        '상세보기',
                        style: TextStyle(
                          color: kGreyColor,
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
