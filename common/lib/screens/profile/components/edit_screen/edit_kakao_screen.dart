import 'package:flutter/material.dart';
import 'edit_screen_appbar.dart';
import '../../../../controllers/user_controller.dart';
import '../../../../constants.dart';
import '../../../../models/user.dart';

class EditKakaoScreen extends StatelessWidget {
  final User user;
  EditKakaoScreen({
    Key? key,
    required this.user,
  }) : super(key: key);
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EditScreenAppBar(
        title: '카카오톡 링크',
        onPressed: () async {
          await UserController.to
              .setUserKakaoLinkUrl('https://${_controller.text}');
          user.setUserKakaoLinkUrl('https://${_controller.text}');
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
                prefixText: 'https://',
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
                '플러스 친구 또는 오픈카톡 링크를 입력해주세요',
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
