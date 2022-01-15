import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/sign_screen_app_bar.dart';
import 'components/sign_screen_name_check_area.dart';
import 'components/sign_screen_name_check_bottom_sheet.dart';
import 'components/sign_screen_phone_check_area.dart';
import 'components/sign_screen_phone_check_bottom_sheet.dart';
import '../main/main_screen.dart';
import '../../constants.dart';
import '../../controllers/database_controller.dart';
import '../../controllers/local_controller.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({Key? key}) : super(key: key);
  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  bool _isLoading = false;

  int _currentIndex = 0;
  final TextEditingController _phoneNumberEditingController =
      TextEditingController();
  final TextEditingController _nameEditingController = TextEditingController();
  bool _isPhoneNumberEnabled = false;
  bool _phoneNumberChecked = false;

  bool _isNameEnabled = false; // 2~6자인지 체크
  bool _nameChecked = false; // 중복확인 했는지 체크
  bool _isNameDuplicated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: SignScreenAppBar(
        currentIndex: _currentIndex,
        backPressed: () {
          if (_currentIndex == 0) {
            Get.back();
          } else if (_currentIndex == 1) {
            setState(() {
              _currentIndex = 0;
            });
          }
        },
      ),
      body: _currentIndex == 0
          ? SignScreenPhoneCheckArea(
              enablePhoneNumber: _isPhoneNumberEnabled,
              phoneNumberChecked: _phoneNumberChecked,
              checkPhoneNumber: (bool check) {
                setState(() {
                  _isPhoneNumberEnabled = check;
                });
              },
              checkButtonPressed: () {
                setState(() {
                  _phoneNumberChecked = true;
                });
              },
              controller: _phoneNumberEditingController,
            )
          : SignScreenNameCheckArea(
              controller: _nameEditingController,
              enabledName: _isNameEnabled,
              nameChecked: _nameChecked,
              nameDuplicated: _isNameDuplicated,
              checkEnabledName: (bool check) {
                setState(() {
                  _isNameEnabled = check;
                });
              },
              checkButtonPressed: () {
                setState(() {
                  if (_nameEditingController.text == 'hahaha') {
                    _isNameDuplicated = true;
                  } else {
                    _nameChecked = true;
                  }
                });
              },
            ),
      bottomSheet: _currentIndex == 0
          ? SignScreenPhoneCheckBottomSheet(
              phoneNumberChecked: _phoneNumberChecked,
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
            )
          : SignScreenNameCheckBottomSheet(
              nameChecked: _nameChecked,
              onPressed: () async {
                if (_isLoading == false) {
                  setState(() {
                    _isLoading = true;
                  });
                  Map<String, dynamic> body = {
                    'name': _nameEditingController.text,
                    'phoneNumber': _phoneNumberEditingController.text,
                    'university': '충남대학교',
                    'job': '',
                    'imageUrl': noPersonImage,
                    'instaId': '',
                    'kakaoLinkUrl': '',
                    'userTagList': [],
                    'applyGatheringList': [],
                    'openGatheringList': [],
                    'likeGathering': [],
                    'likeUser': [],
                    'timeStamp': DateTime.now().toString(),
                  };
                  await DatabaseController.to
                      .makeUser(body)
                      .then((value) async {
                    await LocalController.to.setId(value);
                    Get.offAll(
                      () => const MainScreen(),
                    );
                  });
                }
              }),
    );
  }
}
