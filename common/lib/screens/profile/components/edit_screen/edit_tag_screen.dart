import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'edit_screen_appbar.dart';
import '../../../../controllers/user_controller.dart';
import '../../../../components/gathering_card_tag.dart';
import '../../../../constants.dart';

class EditTagScreen extends StatefulWidget {
  const EditTagScreen({
    Key? key
  }) : super(key: key);

  @override
  State<EditTagScreen> createState() => _EditTagScreenState();
}

class _EditTagScreenState extends State<EditTagScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _tagList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EditScreenAppBar(
        title: '소개 해시태그',
        onPressed: () async {
          await UserController.to.setUserTagList(_tagList);
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '소개 해시태그',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            _tagList.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: GatheringCardTag(tagList: _tagList),
                  )
                : Container(),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.clear),
              ),
              onSubmitted: (String s) {
                _tagList.add(s);
                _controller.clear();
                setState(() {});
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                '10글자 이내로 나를 나타낼 수 있는 해시태그를 입력해주세요',
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
