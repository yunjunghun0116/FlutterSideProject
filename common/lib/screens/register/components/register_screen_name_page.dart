import 'package:flutter/material.dart';
import '../../../constants.dart';

class RegisterScreenNamePage extends StatelessWidget {
  final TextEditingController nameController;
  final bool nameEnabled;
  final Color buttonColor;
  final Function nameCheckFunction;
  final Function registerFunction;
  const RegisterScreenNamePage(
      {Key? key,
      required this.nameController,
      required this.nameEnabled,
        required this.buttonColor,
      required this.nameCheckFunction,
      required this.registerFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '사용할 닉네임을\n입력해주세요',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        TextField(
          autofocus: true,
          controller: nameController,
          maxLength: 8,
          decoration: InputDecoration(
            hintText: '2~8글자 닉네임을 입력해주세요',
            focusedBorder:
                nameEnabled ? kBlueUnderlineBorder : kRedUnderlineBorder,
            suffix: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: (){
                    nameController.text = '';
                  },
                  child: const Icon(
                    Icons.clear,
                  ),
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.check,
                  color: nameEnabled ? kBlueColor : kRedColor,
                  size: 20,
                ),
              ],
            ),
          ),
          onChanged: (String s) {
            nameCheckFunction(s);
          },
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: (){
            registerFunction();
          },
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              '완료',
              style: TextStyle(
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
