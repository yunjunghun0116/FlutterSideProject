import 'package:flutter/material.dart';

import '../../../constants.dart';

class RegisterScreenPasswordPagePasswordArea extends StatelessWidget {
  final TextEditingController passwordController;
  final bool passwordChecked;
  final bool passwordEnabled;
  final bool passwordCheckEnabled;
  final String passwordGuideLine;
  final Function passwordCheckFunction;
  final Function passwordRefreshFunction;
  const RegisterScreenPasswordPagePasswordArea({
    Key? key,
    required this.passwordController,
    required this.passwordChecked,
    required this.passwordEnabled,
    required this.passwordCheckEnabled,
    required this.passwordGuideLine,
    required this.passwordCheckFunction,
    required this.passwordRefreshFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '비밀번호를\n입력해주세요',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            passwordChecked
                ? GestureDetector(
                    onTap: () {
                      passwordRefreshFunction();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: kBlueColor,
                        ),
                      ),
                      child: const Text(
                        '다시 설정하기',
                        style: TextStyle(
                          color: kBlueColor,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
        TextField(
          enabled: !passwordChecked,
          controller: passwordController,
          obscureText: true,
          maxLength: 14,
          style: TextStyle(
            color: passwordChecked ? kGreyColor : kBlackColor,
          ),
          decoration: InputDecoration(
            hintText: '6~14자리 비밀번호를 입력해주세요',
            focusedBorder:
                passwordEnabled ? kBlueUnderlineBorder : kRedUnderlineBorder,
            suffix: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    passwordController.text = '';
                  },
                  child: const Icon(
                    Icons.clear,
                  ),
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.check,
                  color: passwordEnabled ? kBlueColor : kRedColor,
                  size: 20,
                ),
              ],
            ),
          ),
          onChanged: (String s) {
            passwordCheckFunction(s);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            passwordGuideLine,
            style: passwordEnabled ? kEnabledTextStyle : kDisabledTextStyle,
          ),
        ),
      ],
    );
  }
}
