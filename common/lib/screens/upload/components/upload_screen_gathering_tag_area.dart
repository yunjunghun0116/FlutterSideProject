import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../components/gathering_card_tag.dart';

class UploadScreenGatheringTagArea extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final Function tagEnterPressed;
  final List<String> tagList;
  const UploadScreenGatheringTagArea({
    Key? key,
    required this.focusNode,
    required this.controller,
    required this.tagEnterPressed,
    required this.tagList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            '모임 해시태그',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        tagList.isNotEmpty
            ? Column(
                children: [
                  GatheringCardTag(tagList: tagList),
                  const SizedBox(height: 10),
                ],
              )
            : Container(),
        TextField(
          focusNode: focusNode,
          controller: controller,
          minLines: 1,
          maxLines: 1,
          onChanged: (String s) {
            if (s.isNotEmpty && s.substring(s.length - 1) == '\n') {
              tagEnterPressed(s.trim());
              controller.clear();
              focusNode.unfocus();
            }
          },
          onSubmitted: (String s) {
            if (s.isNotEmpty) {
              tagEnterPressed(s.trim());
              controller.clear();
              focusNode.unfocus();
            }
          },
          decoration: InputDecoration(
            border: kGreyOutlinedBorder,
            enabledBorder: kGreyOutlinedBorder,
            focusedBorder: kFocusOutlinedBorder,
            filled: true,
            hintStyle: const TextStyle(color: kGreyColor),
            hintText: "태그를 추가해주세요!!",
            fillColor: kWhiteColor,
          ),
        ),
      ],
    );
  }
}
