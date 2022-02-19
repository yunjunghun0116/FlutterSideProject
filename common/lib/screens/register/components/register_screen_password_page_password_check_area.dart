import 'package:flutter/material.dart';

import '../../../constants.dart';

class RegisterScreenPasswordPagePasswordCheckArea extends StatelessWidget {
  final TextEditingController passwordCheckController;
  final bool passwordCheckEnabled;
  final String passwordCheckGuideLine;
  final Function passwordSameCheckFunction;
  const RegisterScreenPasswordPagePasswordCheckArea({
    Key? key,
    required this.passwordCheckController,
    required this.passwordCheckEnabled,
    required this.passwordCheckGuideLine,
    required this.passwordSameCheckFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '비밀번호를 다시한번 입력해주세요',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        TextField(
          enabled: !passwordCheckEnabled,
          controller: passwordCheckController,
          maxLength: 14,
          obscureText: true,
          style: TextStyle(
            color: passwordCheckEnabled ? kGreyColor : kBlackColor,
          ),
          decoration: InputDecoration(
            hintText: '6~14자리 비밀번호를 입력해주세요',
            counterText: '',
            focusedBorder: passwordCheckEnabled
                ? kBlueUnderlineBorder
                : kRedUnderlineBorder,
            suffix: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    passwordCheckController.text = '';
                  },
                  child: const Icon(
                    Icons.clear,
                  ),
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.check,
                  color: passwordCheckEnabled ? kBlueColor : kRedColor,
                  size: 20,
                ),
              ],
            ),
          ),
          onChanged: (String s) {
passwordSameCheckFunction(s);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            passwordCheckGuideLine,
            style:
                passwordCheckEnabled ? kEnabledTextStyle : kDisabledTextStyle,
          ),
        ),
      ],
    );
  }
}
