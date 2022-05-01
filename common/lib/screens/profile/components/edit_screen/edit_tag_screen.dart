import 'package:common/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'edit_screen_appbar.dart';
import '../../../../controllers/user_controller.dart';
import '../../../../components/gathering_card_tag.dart';
import '../../../../constants.dart';

class EditTagScreen extends StatefulWidget {
  const EditTagScreen({Key? key}) : super(key: key);

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
        child: SingleChildScrollView(
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
                      child: Wrap(
                        children: _tagList.map((e) {
                          return Container(
                            margin: const EdgeInsets.only(right: 5),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: kWhiteColorE7,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(width: 5),
                                Text(
                                  e,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(width: 5),
                                GestureDetector(
                                  onTap: () {
                                    _tagList.remove(e);
                                    setState(() {});
                                  },
                                  child: const Icon(
                                    Icons.cancel_outlined,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  : Container(),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () => _controller.clear(),
                    child: const Icon(
                      Icons.clear,
                      color: kMainColor,
                    ),
                  ),
                  focusedBorder: kEnableUnderlineBorder,
                ),
                onSubmitted: (String s) {
                  if (_tagList.contains(s)) {
                    getDialog(title: '중복된 키워드입력은 불가능합니다!!');
                    return;
                  }
                  if (s.trim().isEmpty) return;
                  _tagList.add(s.trim());
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
      ),
    );
  }
}
