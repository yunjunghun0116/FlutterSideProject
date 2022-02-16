import 'package:common/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/user_screen_content_card.dart';
import 'components/user_screen_content_title.dart';
import '../../components/gathering_screen.dart';
import '../profile/profile_screen.dart';
import '../../constants.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 1,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const Text('my'),
      ),
      body: GetBuilder<UserController>(
        builder: (_) {
          UserController.to.currentUserUpdate(UserController.to.user!.id);
          return Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const UserScreenContentTitle(title: '내정보'),
                  UserScreenContentCard(
                      text: '프로필 보기',
                      onPressed: () => Get.to(
                            () => ProfileScreen(user: UserController.to.user!),
                          )),
                  const UserScreenContentTitle(title: '모임 정보'),
                  UserScreenContentCard(
                    text: '호스트로 주최한 모임',
                    onPressed: () => Get.to(
                      () => GatheringScreen(
                          title: '호스트로 주최한 모임',
                          gatheringList:
                              UserController.to.user!.openGatheringList),
                    ),
                  ),
                  UserScreenContentCard(
                    text: '게스트로 참여한 모임',
                    onPressed: () => Get.to(
                      () => GatheringScreen(
                          title: '게스트로 참여한 모임',
                          gatheringList:
                              UserController.to.user!.applyGatheringList),
                    ),
                  ),
                  const UserScreenContentTitle(title: '어플정보'),
                  UserScreenContentCard(text: '공지사항', onPressed: () {}),
                  UserScreenContentCard(text: '1:1 문의', onPressed: () {}),
                  // UserScreenContentCard(
                  //     text: '기기데이터 초기화',
                  //     onPressed: () {
                  //       LocalController.to.clearSharedPreferences();
                  //     }),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      '버전 1.0.0',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
