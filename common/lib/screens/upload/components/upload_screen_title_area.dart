import 'package:flutter/material.dart';
import '../../../constants.dart';

class UploadScreenTitleArea extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  const UploadScreenTitleArea(
      {Key? key, required this.controller, required this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            '제목',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        TextField(
          focusNode: focusNode,
          controller: controller,
          minLines: 2,
          maxLines: 2,
          maxLength: 20,
          onChanged: (String s) {
            if (s.isNotEmpty &&s.substring(s.length - 1) == '\n') {
              focusNode.unfocus();
            }
          },
          decoration: InputDecoration(
            border: kGreyOutlinedBorder,
            enabledBorder: kGreyOutlinedBorder,
            focusedBorder: kFocusOutlinedBorder,
            filled: true,
            hintStyle: const TextStyle(color: kGreyColor),
            hintText: "제목을 입력해주세요!!",
            fillColor: kWhiteColor,
          ),
        ),
      ],
    );
  }
}
