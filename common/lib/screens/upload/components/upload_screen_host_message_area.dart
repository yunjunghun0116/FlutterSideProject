import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'upload_screen_icon_text.dart';

class UploadScreenHostMessageArea extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  const UploadScreenHostMessageArea({
    Key? key,
    required this.focusNode,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UploadScreenIconText(
          title: '하루모임 설명',
          icon: Icons.chat,
        ),
        const SizedBox(height: 10),
        TextField(
          focusNode: focusNode,
          controller: controller,
          minLines: 1,
          maxLines: 100,
          maxLength: 1000,
          decoration: InputDecoration(
            border: kGreyOutlinedBorder,
            enabledBorder: kGreyOutlinedBorder,
            focusedBorder: kFocusOutlinedBorder,
            filled: true,
            hintStyle: const TextStyle(color: kGreyColor),
            hintText: "하루모임에 대해 설명해주세요!!",
            counterText: '',
            fillColor: kWhiteColor,
          ),
        ),
      ],
    );
  }
}
