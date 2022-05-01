import 'package:common/constants.dart';
import 'package:common/controllers/local_controller.dart';
import 'package:common/controllers/user_controller.dart';
import 'package:common/screens/main/main_screen.dart';
import 'package:common/screens/start/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  void _checkUserSignedIn() async {
    String? _userId = await (LocalController.to.getId());
    if (_userId != null) {
      bool value = await UserController.to.currentUserUpdate(_userId);
      if (value) {
        Get.off(() => const MainScreen());
        return;
      }
    }
    Get.off(() => const StartScreen());
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(milliseconds: 1500), () => _checkUserSignedIn());
    return Scaffold(
      backgroundColor: kSplashBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 28,
                    color: kGreyColor,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(text: '함께하는 취미생활\n'),
                    TextSpan(text: '다같이 하루모임\n'),
                    TextSpan(
                      text: 'Common\n',
                      style: TextStyle(
                        color: kMainColor,
                        fontSize: 40,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                'assets/logo/common_logo.png',
                width: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
