import 'package:flutter/material.dart';
import 'edit_screen_appbar.dart';
import '../../../../controllers/user_controller.dart';
import '../../../../constants.dart';
import '../../../../models/user.dart';

class EditJobScreen extends StatelessWidget {
  final User user;
  EditJobScreen({
    Key? key,
    required this.user,
  }) : super(key: key);
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EditScreenAppBar(
        title: '직업',
        onPressed: () async {
          await UserController.to.setUserJob(_controller.text);
          user.setUserJob(_controller.text);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '직업',
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
                '직업을 적어주세요',
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
