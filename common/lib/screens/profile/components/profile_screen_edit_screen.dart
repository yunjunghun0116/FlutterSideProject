import 'dart:io';
import 'package:common/controllers/local_controller.dart';
import 'package:common/controllers/user_controller.dart';
import 'package:common/screens/start/start_screen.dart';
import 'package:common/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'edit_screen/edit_kakao_screen.dart';
import 'edit_screen/edit_name_screen.dart';
import 'edit_screen/edit_tag_screen.dart';
import 'profile_screen_edit_screen_image_area.dart';
import 'profile_screen_edit_screen_info_card.dart';
import 'edit_screen/edit_job_screen.dart';
import 'profile_screen_edit_screen_info_tag_card.dart';
import '../../../constants.dart';
import '../../../models/user.dart';

class ProfileScreenEditScreen extends StatelessWidget {
  final User user;
  ProfileScreenEditScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  final picker = ImagePicker();
  Future<bool> updateImage() async {
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return false;
    File image = File(pickedFile.path);
    String? _downloadUrl = await UserController.to.updateImage(image);
    if (_downloadUrl != null) {
      Map<String, String> body = {'imageUrl': _downloadUrl};
      return await UserController.to.updateUser(body);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kGreyColor,
        elevation: 1,
        titleSpacing: 0,
        centerTitle: false,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            }),
        title: const Text(
          '프로필 편집',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: kBlackColor,
          ),
        ),
      ),
      body: GetBuilder<UserController>(
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ProfileScreenEditScreenImageArea(
                        imageUrl: UserController.to.user!.imageUrl,
                        updateImage: () async {
                          await updateImage().then((value) {
                            if (value) {
                              getDialog(title: '이미지 변경 완료', fontSize: 16);
                            }
                          });
                        },
                      ),
                      ProfileScreenEditScreenInfoCard(
                        title: '닉네임',
                        text: UserController.to.user!.name,
                        onPressed: () => Get.to(() => const EditNameScreen()),
                      ),
                      ProfileScreenEditScreenInfoCard(
                        title: '직업',
                        text: UserController.to.user!.job,
                        onPressed: () => Get.to(() => EditJobScreen()),
                      ),
                      ProfileScreenEditScreenInfoTagCard(
                        title: '소개 해시태그',
                        tagList: UserController.to.user!.userTagList,
                        onPressed: () => Get.to(() => const EditTagScreen()),
                      ),
                      ProfileScreenEditScreenInfoCard(
                        title: '카카오톡 링크',
                        text: UserController.to.user!.kakaoLinkUrl,
                        onPressed: () => Get.to(() => EditKakaoScreen()),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Expanded(
                            flex: 7,
                            child: Text(
                              '카카오톡 링크 입력시 유저가 \n카카오톡을 통해 연락할수 있어요!!',
                              style: TextStyle(
                                color: kGreyColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SafeArea(
                  child: GestureDetector(
                    onTap: () async {
                      await checkDialog(
                        title: '로그아웃 하시겠습니까?',
                        sureText: '로그아웃',
                        onPressed: () async {
                          await LocalController.to.clearSharedPreferences();
                          Get.offAll(() => const StartScreen());
                        },
                      );
                    },
                    child: const Text(
                      '로그아웃',
                      style: TextStyle(
                        fontSize: 14,
                        color: kGreyColor,
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
          );
        },
      ),
    );
  }
}
