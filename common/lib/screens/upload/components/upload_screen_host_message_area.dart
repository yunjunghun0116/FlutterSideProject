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
          title: '호스트의 한마디',
          icon: Icons.chat,
        ),
        const SizedBox(height: 10),
        TextField(
          focusNode: focusNode,
          controller: controller,
          minLines: 2,
          maxLines: 2,
          maxLength: 20,
          onChanged: (String s) {
            if (s.isNotEmpty&&s.substring(s.length - 1) == '\n') {
              focusNode.unfocus();
            }
          },
          decoration: InputDecoration(
            border: kGreyOutlinedBorder,
            enabledBorder: kGreyOutlinedBorder,
            focusedBorder: kFocusOutlinedBorder,
            filled: true,
            hintStyle: const TextStyle(color: kGreyColor),
            hintText: "호스트의 한마디를 입력해주세요!!",
            fillColor: kWhiteColor,
          ),
        ),
      ],
    );
  }
}
