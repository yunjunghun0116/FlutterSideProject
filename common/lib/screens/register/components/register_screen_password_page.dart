import 'package:common/screens/register/components/register_screen_password_page_password_area.dart';
import 'package:common/screens/register/components/register_screen_password_page_password_check_area.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class RegisterScreenPasswordPage extends StatelessWidget {
  final TextEditingController passwordController;
  final bool passwordChecked;
  final bool passwordEnabled;
  final String passwordGuideLine;
  final TextEditingController passwordCheckController;
  final bool passwordCheckEnabled;
  final String passwordCheckGuideLine;
  final Color buttonColor;
  final Function passwordCheckFunction;
  final Function passwordSameCheckFunction;
  final Function buttonPressedFunction;
  final Function passwordRefreshFunction;
  const RegisterScreenPasswordPage({
    Key? key,
    required this.passwordController,
    required this.passwordChecked,
    required this.passwordEnabled,
    required this.passwordGuideLine,
    required this.passwordCheckController,
    required this.passwordCheckEnabled,
    required this.passwordCheckGuideLine,
    required this.buttonColor,
    required this.passwordCheckFunction,
    required this.passwordSameCheckFunction,
    required this.buttonPressedFunction,
    required this.passwordRefreshFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RegisterScreenPasswordPagePasswordArea(
          passwordController: passwordController,
          passwordChecked: passwordChecked,
          passwordEnabled: passwordEnabled,
          passwordCheckEnabled: passwordCheckEnabled,
          passwordGuideLine: passwordGuideLine,
          passwordCheckFunction: passwordCheckFunction,
          passwordRefreshFunction: passwordRefreshFunction,
        ),
        passwordChecked
            ? RegisterScreenPasswordPagePasswordCheckArea(
                passwordCheckController: passwordCheckController,
                passwordCheckEnabled: passwordCheckEnabled,
                passwordCheckGuideLine: passwordCheckGuideLine,
                passwordSameCheckFunction: passwordSameCheckFunction,
              )
            : Container(),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            buttonPressedFunction();
          },
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              passwordChecked ? '완료' : '비밀번호사용하기',
              style: const TextStyle(
                color: kWhiteColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
