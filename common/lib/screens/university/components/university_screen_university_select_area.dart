import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../controllers/user_controller.dart';
import '../../main/main_screen.dart';

class UniversityScreenUniversitySelectArea extends StatelessWidget {
  final List universityList;
  const UniversityScreenUniversitySelectArea({
    Key? key,
    required this.universityList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: universityList.map((university) {
          return GestureDetector(
            onTap: () async {
              //university in 서비스 지원 학교 => 성공로직으로
              if (university == '충남대학교' || university == '한국과학기술대학교') {
                await UserController.to
                    .setUserUniversity(university)
                    .then((value) {
                  if (value) {
                    Get.offAll(() => const MainScreen());
                  }
                });
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: const Text('서비스 지원 미등록 학교'),
                      content: const Text(
                        '아직 서비스 지원을 하지 않는 학교예요ㅠㅠ\n해당 학교에 서비스 지원을 요청할까요?',
                        style: TextStyle(fontSize: 12),
                      ),
                      actions: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: const Text(
                                      '닫기',
                                      style: TextStyle(
                                        color: kBlueColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: const Text(
                                      '요청하기',
                                      style: TextStyle(
                                        color: kBlueColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(university),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
