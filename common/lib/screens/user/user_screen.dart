import 'package:common/controllers/user_controller.dart';
import 'package:common/screens/terms/terms_screen.dart';
import 'package:common/screens/user/components/user_screen_announce_page.dart';
import 'package:common/screens/user/components/user_screen_block_user_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'components/user_screen_content_card.dart';
import 'components/user_screen_content_title.dart';
import '../../components/gathering_screen.dart';
import '../profile/profile_screen.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserController>(
        builder: (_) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const UserScreenContentTitle(title: '내 정보'),
                    UserScreenContentCard(
                        text: '프로필 보기',
                        onPressed: () => Get.to(
                              () =>
                                  ProfileScreen(user: UserController.to.user!),
                            )),
                    const UserScreenContentTitle(title: '모임 정보'),
                    UserScreenContentCard(
                      text: '내가 만든 하루모임',
                      onPressed: () => Get.to(
                        () => GatheringScreen(
                          title: '내가 만든 하루모임',
                          status: '주최',
                          userId: UserController.to.user!.id,
                        ),
                      ),
                    ),
                    UserScreenContentCard(
                      text: '내가 참여한 하루모임',
                      onPressed: () => Get.to(
                        () => GatheringScreen(
                          title: '내가 참여한 하루모임',
                          status: '참여',
                          userId: UserController.to.user!.id,
                        ),
                      ),
                    ),
                    const UserScreenContentTitle(title: '어플 정보'),
                    UserScreenContentCard(
                      text: '공지사항',
                      onPressed: () =>
                          Get.to(() => const UserScreenAnnouncePage()),
                    ),
                    UserScreenContentCard(
                      text: '자랑하기[이벤트]',
                      onPressed: () => launchUrl(
                          Uri.parse('https://open.kakao.com/o/s2VO2O0d')),
                    ),
                    UserScreenContentCard(
                      text: '차단한 유저 목록',
                      onPressed: () =>
                          Get.to(() => const UserScreenBlockUserPage()),
                    ),
                    UserScreenContentCard(
                      text: '1:1 문의',
                      onPressed: () =>
                          launchUrl(Uri.parse('http://pf.kakao.com/_dHVrb')),
                    ),
                    UserScreenContentCard(
                      text: '이용약관',
                      onPressed: () => Get.to(() => const TermsScreen()),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        '버전 1.1.5',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
