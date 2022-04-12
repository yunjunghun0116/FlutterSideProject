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
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 50),
            child: Image.asset(
              'assets/logo/common_typing_logo.png',
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
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
                  color: kMainColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  '로그인하기',
                  style: TextStyle(
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              Get.to(() => const RegisterScreen());
            },
            child: Container(
              alignment: Alignment.center,
              child: const Text(
                '회원가입하기',
                style: TextStyle(
                  fontSize: 18,
                  color: kMainColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
