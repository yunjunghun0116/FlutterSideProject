import 'package:flutter/material.dart';
import '../../../utils.dart';
import '../../../constants.dart';

class RegisterScreenPhonePageCertificationArea extends StatelessWidget {
  final TextEditingController certificationController;
  final bool certificationEnabled;
  final String certificationGuideLine;
  final String? certificationNumber;
  final int currentSeconds;
  final Function certificationCheckFunction;
  const RegisterScreenPhonePageCertificationArea({
    Key? key,
    required this.certificationController,
    required this.certificationEnabled,
    required this.certificationGuideLine,
    required this.certificationNumber,
    required this.currentSeconds, required this.certificationCheckFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '인증번호 4자리를 입력해주세요',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        TextField(
          enabled: !certificationEnabled,
          controller: certificationController,
          keyboardType: TextInputType.number,
          maxLength: 4,
          style: TextStyle(
            color: certificationEnabled?kGreyColor:kBlackColor,
          ),
          decoration: InputDecoration(
            hintText: '0000',
            counterText: '',
            focusedBorder: certificationEnabled
                ? kBlueUnderlineBorder
                : kRedUnderlineBorder,
            suffix: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                !certificationEnabled
                    ? GestureDetector(
                        onTap: () {
                          certificationController.text = '';
                        },
                        child: const Icon(Icons.clear),
                      )
                    : Container(),
                const SizedBox(width: 10),
                Icon(
                  Icons.check,
                  color: certificationEnabled ? kBlueColor : kRedColor,
                  size: 20,
                ),
              ],
            ),
          ),
          onChanged: (String s) {
            certificationCheckFunction(s);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                certificationGuideLine,
                style: certificationEnabled
                    ? kEnabledTextStyle
                    : kDisabledTextStyle,
              ),
              !certificationEnabled
                  ? Text(
                      getCertificationTime(currentSeconds),
                      style: const TextStyle(color: kRedColor),
                    )
                  : const Text(''),
            ],
          ),
        ),
      ],
    );
  }
}
