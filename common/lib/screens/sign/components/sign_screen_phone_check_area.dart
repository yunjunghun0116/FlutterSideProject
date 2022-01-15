import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../controllers/database_controller.dart';

class SignScreenPhoneCheckArea extends StatelessWidget {
  final bool enablePhoneNumber;
  final bool phoneNumberChecked;
  final Function checkPhoneNumber;
  final Function checkButtonPressed;
  final TextEditingController controller;
  const SignScreenPhoneCheckArea({
    Key? key,
    required this.enablePhoneNumber,
    required this.phoneNumberChecked,
    required this.checkPhoneNumber,
    required this.checkButtonPressed,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DatabaseController _controller = DatabaseController.to;

    return Column(
      children: [
        const Text('휴대폰번호를 입력해주세요'),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      enabled: !phoneNumberChecked,
                      onChanged: (String s) {
                        if (s.length > 11) {
                          controller.text = s.substring(0, 11);
                        }
                        if (s.length == 10 ||
                            s.length == 11 &&
                                kPhoneNumberList.contains(s.substring(0, 3))) {
                          checkPhoneNumber(true);
                        } else {
                          if (enablePhoneNumber) {
                            checkPhoneNumber(false);
                          }
                        }
                      },
                      controller: controller,
                      autofocus: true,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    !enablePhoneNumber
                        ? const Text(
                            '휴대폰 번호가 올바르지 않습니다',
                            style: TextStyle(color: kRedColor),
                          )
                        : const Text(''),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                if (enablePhoneNumber) {
                  if (await _controller
                      .checkPhoneNumberIsDuplicated(controller.text)) {
                    checkButtonPressed();
                  }
                }
              },
              child: Container(
                margin: const EdgeInsets.only(right: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: enablePhoneNumber
                      ? phoneNumberChecked
                          ? kGreyColor
                          : kBlueColor
                      : kGreyColor,
                ),
                width: 80,
                height: 40,
                child: Text(
                  phoneNumberChecked ? '확인완료' : '확인',
                  style: const TextStyle(
                    color: kWhiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
