import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'edit_screen_appbar.dart';
import '../../../../controllers/user_controller.dart';
import '../../../../constants.dart';

class EditJobScreen extends StatelessWidget {

  EditJobScreen({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EditScreenAppBar(
        title: '직업',
        onPressed: () async {
          await UserController.to.setUserJob(_controller.text);
          Get.back();
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
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.clear),
                hintText: UserController.to.user!.job,
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
