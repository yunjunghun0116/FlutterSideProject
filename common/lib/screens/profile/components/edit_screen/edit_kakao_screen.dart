import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'edit_screen_appbar.dart';
import '../../../../controllers/user_controller.dart';
import '../../../../constants.dart';
import '../../../../models/user.dart';

class EditKakaoScreen extends StatelessWidget {
  EditKakaoScreen({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EditScreenAppBar(
        title: '카카오톡 링크',
        onPressed: () async {
          if (_controller.text.length > 25 &&
              _controller.text.substring(0, 25) ==
                  'https://open.kakao.com/o/') {
            await UserController.to.setUserKakaoLinkUrl(_controller.text);
          } else {
            await Get.defaultDialog(
              middleText: '올바른 형식의 카카오톡 링크를 입력해주세요',
              cancel: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('확인'),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '카카오톡 링크',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                prefixStyle: TextStyle(
                  color: kBlackColor,
                  fontSize: 16,
                ),
                suffixIcon: Icon(Icons.clear),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                '오픈카톡 링크를 입력해주세요',
                style: TextStyle(
                  color: kGreyColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
