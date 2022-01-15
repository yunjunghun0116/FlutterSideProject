import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../controllers/database_controller.dart';

class SignScreenNameCheckArea extends StatelessWidget {
  final TextEditingController controller;
  final bool enabledName;
  final bool nameChecked;
  final bool nameDuplicated;
  final Function checkEnabledName;
  final Function checkButtonPressed;
  const SignScreenNameCheckArea({
    Key? key,
    required this.controller,
    required this.enabledName,
    required this.nameChecked,
    required this.nameDuplicated,
    required this.checkEnabledName,
    required this.checkButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DatabaseController _controller = DatabaseController.to;

    return Column(
      children: [
        const Text('닉네임'),
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
                      enabled: !nameChecked,
                      onChanged: (String s) {
                        if (s.length >= 2 && s.length < 7) {
                          checkEnabledName(true);
                        } else {
                          checkEnabledName(false);
                        }
                      },
                      controller: controller,
                      autofocus: true,
                      decoration:
                          const InputDecoration(hintText: '2~6글자 닉네임을 입력해주세요'),
                    ),
                    const SizedBox(height: 10),
                    enabledName
                        ? nameChecked
                            ? const Text(
                                '닉네임 사용이 가능합니다',
                                style: TextStyle(color: kBlueColor),
                              )
                            : nameDuplicated
                                ? const Text(
                                    '중복된 닉네임입니다',
                                    style: TextStyle(color: kRedColor),
                                  )
                                : const Text('')
                        : const Text(
                            '닉네임을 다시 확인해주세요',
                            style: TextStyle(color: kRedColor),
                          ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () async{
                if(await _controller.checkNameIsDuplicated(controller.text)){
                  checkButtonPressed();
                }

              },
              child: Container(
                margin: const EdgeInsets.only(right: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: nameChecked ? kGreyColor : kBlueColor,
                ),
                width: 80,
                height: 40,
                child: Text(
                  nameChecked ? '확인 완료' : '중복 확인',
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
