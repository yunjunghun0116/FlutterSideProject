import 'package:flutter/material.dart';
import 'upload_screen_icon_text.dart';
import '../../../constants.dart';

class UploadScreenLocationArea extends StatelessWidget {
  final String location;
  final FocusNode focusNode;
  final TextEditingController controller;
  final Function locationUpdated;
  final Function locationSearchPressed;
  const UploadScreenLocationArea({
    Key? key,
    required this.location,
    required this.focusNode,
    required this.controller,
    required this.locationUpdated,
    required this.locationSearchPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UploadScreenIconText(
          title: '장소',
          icon: Icons.location_on,
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            locationSearchPressed();
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: kGreyColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  location,
                  style:  TextStyle(
                    color:location=='장소를 설정해주세요!!'?kGreyColor:kBlackColor,
                    fontSize: 16,
                  ),
                ),
                const Icon(Icons.search),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          focusNode: focusNode,
          controller: controller,
          minLines: 1,
          maxLines: 2,
          maxLength: 50,
          decoration: InputDecoration(
            border: kGreyOutlinedBorder,
            enabledBorder: kGreyOutlinedBorder,
            focusedBorder: kFocusOutlinedBorder,
            filled: true,
            hintStyle: const TextStyle(color: kGreyColor),
            hintText: "상세 주소를 입력해주세요",
            counterText: '',
            fillColor: kWhiteColor,
          ),
        ),
      ],
    );
  }
}
