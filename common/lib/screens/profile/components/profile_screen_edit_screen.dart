import 'dart:io';
import 'package:common/controllers/user_controller.dart';
import 'package:common/screens/main/main_screen.dart';
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
            Get.offAll(() => const MainScreen());
          },
        ),
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
          return SingleChildScrollView(
            child: Column(
              children: [
                ProfileScreenEditScreenImageArea(
                  imageUrl: UserController.to.user!.imageUrl,
                  updateImage: () async {
                    await updateImage().then((value) {
                      if (value) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              title: const Text('이미지 등록 완료'),
                              actions: [
                                GestureDetector(
                                  onTap: () => Get.back(),
                                  child: Container(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: const Text(
                                        '닫기',
                                        style: TextStyle(
                                          color: kBlueColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
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
              ],
            ),
          );
        },
      ),
    );
  }
}
