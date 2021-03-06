import 'package:common/controllers/local_controller.dart';
import 'package:common/controllers/user_controller.dart';
import 'package:common/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isObsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('로그인'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '휴대폰 번호',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            TextField(
              controller: _phoneController,
              maxLength: 11,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: '휴대폰 번호를 입력해주세요',
                counterText: '',
                focusedBorder: kEnableUnderlineBorder,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '비밀번호',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isObsecureText = !_isObsecureText;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      _isObsecureText ? '표시' : '표시안함',
                      style: const TextStyle(
                        color: kMainColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TextField(
              controller: _passwordController,
              maxLength: 14,
              obscureText: _isObsecureText,
              decoration: const InputDecoration(
                hintText: '비밀번호를 입력해주세요',
                counterText: '',
                focusedBorder: kEnableUnderlineBorder,
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () async {
                String? _id = await UserController.to.signInWithEmailPassword(
                  phone: _phoneController.text,
                  password: _passwordController.text,
                );
                if (_id != null) {
                  LocalController.to.setId(_id);
                  Get.offAll(() => const MainScreen());
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        title: const Text('휴대폰번호와 비밀번호를 \n다시한번 확인해주세요'),
                        actions: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  '확인',
                                  style: TextStyle(
                                    color: kMainColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kMainColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  '로그인하기',
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
