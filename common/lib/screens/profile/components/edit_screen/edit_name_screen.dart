import 'package:common/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'edit_screen_appbar.dart';
import '../../../../controllers/user_controller.dart';
import '../../../../constants.dart';

class EditNameScreen extends StatefulWidget {
  const EditNameScreen({Key? key}) : super(key: key);

  @override
  State<EditNameScreen> createState() => _EditNameScreenState();
}

class _EditNameScreenState extends State<EditNameScreen> {
  final TextEditingController _controller = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EditScreenAppBar(
        title: '닉네임',
        onPressed: () async {
          if (isChecked) {
            await UserController.to.setUserName(_controller.text);
            Get.back();
            return;
          }
          await getDialog('닉네임 중복 확인을 해주세요!!');
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '닉네임',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    enabled: !isChecked,
                    decoration: InputDecoration(
                      suffixIcon: isChecked ? null : const Icon(Icons.clear),
                      hintText: UserController.to.user!.name,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (!isChecked) {
                      if (await UserController.to
                          .checkNameIsDuplicated(_controller.text)) {
                        getDialog('이미 사용중인 닉네임입니다!!\n다른 닉네임을 사용해주세요!!');
                        return;
                      }
                      setState(() {
                        isChecked = true;
                      });
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: isChecked ? kGreyColor : kBlueColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      isChecked ? '확인 완료' : '중복 확인',
                      style: const TextStyle(
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                '2~6 글자 닉네임을 입력해주세요',
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
