import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../main/main_screen.dart';
import '../../../constants.dart';
import '../../../controllers/database_controller.dart';
import '../../../controllers/local_controller.dart';

class StartScreenSignInBottomSheet extends StatelessWidget {
  StartScreenSignInBottomSheet({Key? key}) : super(key: key);

  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 300,
      decoration: const BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '휴대폰 번호',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  String? _id = await DatabaseController.to
                      .getUserWithPhoneNumber(_phoneNumberController.text);
                  if (_id != null) {
                    await LocalController.to.setId(_id);
                    Get.offAll(() => const MainScreen());
                  } else {
                    Get.back(result: false);
                  }
                },
                child: const Text(
                  '로그인',
                  style: TextStyle(
                    color: kBlueColor,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
          TextField(
            controller: _phoneNumberController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.phone,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
