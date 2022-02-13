import 'package:flutter/material.dart';
import 'edit_screen_appbar.dart';
import '../../../../controllers/user_controller.dart';
import '../../../../constants.dart';
import '../../../../models/user.dart';

class EditPhoneScreen extends StatefulWidget {
  final User user;
  const EditPhoneScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<EditPhoneScreen> createState() => _EditPhoneScreenState();
}

class _EditPhoneScreenState extends State<EditPhoneScreen> {
  final TextEditingController _controller = TextEditingController();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EditScreenAppBar(
        title: '휴대폰 번호',
        onPressed: () async {
          if (isChecked) {
            await UserController.to.setUserPhoneNumber(_controller.text);
            widget.user.setUserPhoneNumber(_controller.text);
          }
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '휴대폰 번호',
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
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      //TODO 여기서 중복확인해주기
                      if (!isChecked) {
                        isChecked = true;
                      }
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: isChecked?kGreyColor:kBlueColor,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Text(
                      isChecked ? '확인 완료' : ' 확인 ',
                      style: const TextStyle(
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
