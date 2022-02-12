import 'package:flutter/material.dart';
import '../../../constants.dart';

class RegisterScreenPhonePagePhoneArea extends StatelessWidget {
  final TextEditingController phoneController;
  final bool phoneChecked;
  final bool phoneEnabled;
  final String phoneGuideLine;
  final bool certificationEnabled;
  final Function phoneCheckFunction;
  final Function phoneRefreshFunction;
  final Function sendCertificationNumberFunction;
  const RegisterScreenPhonePagePhoneArea({
    Key? key,
    required this.phoneController,
    required this.phoneChecked,
    required this.phoneEnabled,
    required this.phoneGuideLine,
    required this.certificationEnabled,
    required this.phoneCheckFunction,
    required this.phoneRefreshFunction,
    required this.sendCertificationNumberFunction,
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
              '휴대폰 번호를\n입력해주세요',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            phoneChecked
                ? GestureDetector(
                    onTap: () {
                      if (certificationEnabled) {
                        phoneRefreshFunction();
                      }
                      sendCertificationNumberFunction();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: kBlueColor,
                        ),
                      ),
                      child: Text(
                        certificationEnabled ? '휴대폰번호 변경' : '인증번호 다시 받기',
                        style: const TextStyle(
                          color: kBlueColor,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
        TextField(
          autofocus: true,
          enabled: !phoneChecked,
          controller: phoneController,
          keyboardType: TextInputType.number,
          maxLength: 11,
          style: TextStyle(
            color: phoneChecked ? kGreyColor : kBlackColor,
          ),
          decoration: InputDecoration(
            hintText: 'ex)01012345678',
            counterText: '',
            focusedBorder:
                phoneEnabled ? kBlueUnderlineBorder : kRedUnderlineBorder,
            suffix: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                !phoneChecked
                    ? GestureDetector(
                        onTap: () {
                          phoneController.text = '';
                        },
                        child: const Icon(Icons.clear),
                      )
                    : Container(),
                const SizedBox(width: 10),
                Icon(
                  Icons.check,
                  color: phoneEnabled ? kBlueColor : kRedColor,
                  size: 20,
                ),
              ],
            ),
          ),
          onChanged: (String s) {
            phoneCheckFunction(s);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            phoneGuideLine,
            style: phoneEnabled ? kEnabledTextStyle : kDisabledTextStyle,
          ),
        )
      ],
    );
  }
}
