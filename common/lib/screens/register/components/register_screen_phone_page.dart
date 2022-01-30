import 'package:flutter/material.dart';
import 'register_screen_phone_page_certification_area.dart';
import 'register_screen_phone_page_phone_area.dart';
import '../../../constants.dart';

class RegisterScreenPhonePage extends StatelessWidget {
  final TextEditingController phoneController;
  final bool phoneChecked;
  final bool phoneEnabled;
  final String phoneGuideLine;
  final TextEditingController certificationController;
  final bool certificationEnabled;
  final String certificationGuideLine;
  final String certificationNumber;
  final int currentSeconds;
  final Color buttonColor;
  final Function phoneEnabledFunction;
  final Function phoneDisabledFunction;
  final Function certificationNumberRefreshFunction;
  final Function certificationCheckFunction;
  final Function buttonPressedFunction;
  final Function phoneChangeFunction;
  const RegisterScreenPhonePage({
    Key? key,
    required this.phoneController,
    required this.phoneChecked,
    required this.phoneEnabled,
    required this.phoneGuideLine,
    required this.certificationController,
    required this.certificationEnabled,
    required this.certificationGuideLine,
    required this.certificationNumber,
    required this.currentSeconds,
    required this.buttonColor,
    required this.phoneEnabledFunction,
    required this.phoneDisabledFunction,
    required this.certificationNumberRefreshFunction,
    required this.certificationCheckFunction,
    required this.buttonPressedFunction,
    required this.phoneChangeFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RegisterScreenPhonePagePhoneArea(
          phoneController: phoneController,
          phoneChecked: phoneChecked,
          phoneEnabled: phoneEnabled,
          phoneGuideLine: phoneGuideLine,
          certificationEnabled: certificationEnabled,
          phoneEnabledFunction: phoneEnabledFunction,
          phoneDisabledFunction: phoneDisabledFunction,
          phoneChangeFunction: phoneChangeFunction,
          certificationNumberRefreshFunction:
              certificationNumberRefreshFunction,
        ),
        phoneChecked
            ? RegisterScreenPhonePageCertificationArea(
                certificationController: certificationController,
                certificationEnabled: certificationEnabled,
                certificationGuideLine: certificationGuideLine,
                certificationNumber: certificationNumber,
                currentSeconds: currentSeconds,
                certificationCheckFunction: certificationCheckFunction,
              )
            : Container(),
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
              phoneChecked ? '다음' : '인증번호 받기',
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
