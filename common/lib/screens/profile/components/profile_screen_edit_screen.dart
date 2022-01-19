import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'edit_screen/edit_insta_screen.dart';
import 'edit_screen/edit_kakao_screen.dart';
import 'edit_screen/edit_name_screen.dart';
import 'edit_screen/edit_phone_screen.dart';
import 'edit_screen/edit_tag_screen.dart';
import 'profile_screen_edit_screen_image_area.dart';
import 'profile_screen_edit_screen_info_card.dart';
import 'edit_screen/edit_job_screen.dart';
import 'profile_screen_edit_screen_info_tag_card.dart';
import '../../../constants.dart';
import '../../../controllers/database_controller.dart';
import '../../../models/user.dart';

class ProfileScreenEditScreen extends StatefulWidget {
  final User user;
  const ProfileScreenEditScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<ProfileScreenEditScreen> createState() =>
      _ProfileScreenEditScreenState();
}

class _ProfileScreenEditScreenState extends State<ProfileScreenEditScreen> {
  final picker = ImagePicker();
  Future<bool> updateImage() async {
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return false;
    File image = File(pickedFile.path);
    String? _downloadUrl = await DatabaseController.to.updateImage(image);
    if (_downloadUrl != null) {
      Map<String, String> body = {'imageUrl': _downloadUrl};
     return  await DatabaseController.to.updateUser(body);
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileScreenEditScreenImageArea(
              imageUrl: widget.user.imageUrl,
              updateImage: () async {
                await updateImage().then((value) {
                  if (value) {
                    setState(() {});
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
                              onTap: () {
                                Get.back();
                              },
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
              text: widget.user.name,
              onPressed: () async {
                bool isEdited =
                    await Get.to(() => EditNameScreen(user: widget.user));
                if (isEdited) {
                  setState(() {});
                }
              },
            ),
            ProfileScreenEditScreenInfoCard(
              title: '신상정보',
              text: widget.user.job,
              onPressed: () async {
                bool isEdited =
                    await Get.to(() => EditJobScreen(user: widget.user));
                if (isEdited) {
                  setState(() {});
                }
              },
            ),
            ProfileScreenEditScreenInfoTagCard(
              title: '소개 해시태그',
              tagList: widget.user.userTagList,
              onPressed: () async {
                bool isEdited =
                    await Get.to(() => EditTagScreen(user: widget.user));
                if (isEdited) {
                  setState(() {});
                }
              },
            ),
            ProfileScreenEditScreenInfoCard(
              title: '휴대폰번호',
              text: widget.user.phoneNumber,
              onPressed: () async {
                bool isEdited =
                    await Get.to(() => EditPhoneScreen(user: widget.user));
                if (isEdited) {
                  setState(() {});
                }
              },
            ),
            ProfileScreenEditScreenInfoCard(
              title: '인스타그램 ID',
              text: widget.user.instaId,
              onPressed: () async {
                bool isEdited =
                    await Get.to(() => EditInstaScreen(user: widget.user));
                if (isEdited) {
                  setState(() {});
                }
              },
            ),
            ProfileScreenEditScreenInfoCard(
              title: '카카오톡 링크',
              text: widget.user.kakaoLinkUrl,
              onPressed: () async {
                bool isEdited =
                    await Get.to(() => EditKakaoScreen(user: widget.user));
                if (isEdited) {
                  setState(() {});
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
