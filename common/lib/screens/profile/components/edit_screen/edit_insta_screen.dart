import 'package:flutter/material.dart';
import 'edit_screen_appbar.dart';
import '../../../../controllers/user_controller.dart';
import '../../../../constants.dart';
import '../../../../models/user.dart';

class EditInstaScreen extends StatelessWidget {
  final User user;
  EditInstaScreen({
    Key? key,
    required this.user,
  }) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EditScreenAppBar(
        title: '인스타그램 ID',
        onPressed: () async {
          await UserController.to.setUserInstaId(_controller.text);
          user.setUserInstaId(_controller.text);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '인스타그램 ID',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.clear),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                '인스타그램 계정 ID를 입력해주세요',
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
