import 'package:common/controllers/database_controller.dart';
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
      body: GetBuilder<DatabaseController>(
        builder: (_) {
          return ListView(
            children: DatabaseController.to.user!.likeUser.map((user) {
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
                      User _user = await DatabaseController.to.getUser(user.id);
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
