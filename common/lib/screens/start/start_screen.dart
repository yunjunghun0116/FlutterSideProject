import 'package:common/screens/login/login_screen.dart';
import 'package:common/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../main/main_screen.dart';
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
              '함께 하고싶은\n너를 위한\n우리학교 모임어플',
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
              Get.to(() => const LoginScreen());
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: kBlueColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                '로그인하기',
                style: TextStyle(
                  color: kWhiteColor,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => const RegisterScreen());
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: kGreyColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                '회원가입하기',
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
