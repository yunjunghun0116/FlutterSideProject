import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/start_screen_sign_in_bottom_sheet.dart';
import '../main/main_screen.dart';
import '../sign/sign_screen.dart';
import '../../constants.dart';
import '../../controllers/database_controller.dart';
import '../../controllers/local_controller.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  void _checkUserSignedIn() async {
    String? _userId = await (LocalController.to.getId());
    if (_userId != null) {
      DatabaseController.to.getCurrentUser(_userId).then((value) {
        if (value) {
          Get.offAll(() => const MainScreen());
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _checkUserSignedIn();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            width: double.infinity,
            child: const Text(
              '같이 하고싶은\n너를 위한\n우리학교 모임어플',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: const Text(
              'Common\n커먼',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 80),
          InkWell(
            onTap: () {
              Get.off(() => const SignScreen());
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              color: kGreyColor,
              child: const Text(
                '휴대폰 회원가입하기',
                style: TextStyle(
                  color: kWhiteColor,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              var result =
                  await Get.bottomSheet(StartScreenSignInBottomSheet());
              if (result == false) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: const Text('없는 번호입니다!'),
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
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              color: kBlueColor,
              child: const Text(
                '휴대폰 로그인하기',
                style: TextStyle(
                  color: kWhiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
