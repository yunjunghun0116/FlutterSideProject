import 'package:common/screens/login/login_screen.dart';
import 'package:common/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            width: double.infinity,
            child: const Text(
              '우리지역 사람들과\n함께하는 취미생활',
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
              'Common',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: kBlueColor,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 100),
          InkWell(
            onTap: () {
              Get.to(() => const LoginScreen());
            },
            child: Ink(
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
