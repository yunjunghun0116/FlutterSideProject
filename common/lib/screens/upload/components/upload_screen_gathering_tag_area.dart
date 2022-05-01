import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../components/gathering_card_tag.dart';

class UploadScreenGatheringTagArea extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final Function tagEnterPressed;
  final Function tagRemovePressed;
  final List tagList;
  const UploadScreenGatheringTagArea({
    Key? key,
    required this.focusNode,
    required this.controller,
    required this.tagEnterPressed,
    required this.tagRemovePressed,
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
            '하루모임 키워드',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        tagList.isNotEmpty
            ? Column(
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: tagList.map((e) {
                      return Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: kWhiteColorE7,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(width: 5),
                            Text(
                              e,
                              style: const TextStyle(
                                fontSize: 16
                              ),
                            ),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: () => tagRemovePressed(e),
                              child: const Icon(
                                Icons.cancel_outlined,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 10),
                ],
              )
            : Container(),
        TextField(
          focusNode: focusNode,
          controller: controller,
          minLines: 1,
          maxLines: 1,
          onSubmitted: (String s) {
            if (s.isNotEmpty) {
              tagEnterPressed(s.trim());
              controller.clear();
            }
          },
          decoration: InputDecoration(
            border: kGreyOutlinedBorder,
            enabledBorder: kGreyOutlinedBorder,
            focusedBorder: kFocusOutlinedBorder,
            filled: true,
            hintStyle: const TextStyle(color: kGreyColor),
            hintText: "키워드를 입력해주세요!!",
            fillColor: kWhiteColor,
          ),
        ),
      ],
    );
  }
}
