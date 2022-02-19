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
          minLines: 1,
          maxLines: 10,
          maxLength: 100,
          decoration: InputDecoration(
            border: kGreyOutlinedBorder,
            enabledBorder: kGreyOutlinedBorder,
            focusedBorder: kFocusOutlinedBorder,
            filled: true,
            hintStyle: const TextStyle(color: kGreyColor),
            hintText: "제목을 입력해주세요!!",
            counterText: '',
            fillColor: kWhiteColor,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
