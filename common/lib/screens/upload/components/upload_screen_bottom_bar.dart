import 'package:flutter/material.dart';
import '../../../constants.dart';

class UploadScreenBottomBar extends StatelessWidget {
  final bool isUpdate;
  final Function uploadPressed;
  const UploadScreenBottomBar({
    Key? key,
    required this.isUpdate,
    required this.uploadPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 10,
        top: 10,
        left: 10,
        right: 10,
      ),
      child: GestureDetector(
        onTap: () {
          uploadPressed();
        },
        child: Container(
          alignment: Alignment.center,
          height: 40,
          decoration: BoxDecoration(
            color: kBlueColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            isUpdate?'수정하기':'등록하기',
            style: const TextStyle(
              color: kWhiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
