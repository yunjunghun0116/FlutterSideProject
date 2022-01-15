import 'package:flutter/material.dart';
import 'package:freeviewpt/screens/user/components/user_screen_like_designer.dart';
import '../../../constants.dart';
import 'components/user_screen_info_card.dart';
import 'components/user_screen_like_button.dart';
import 'components/user_screen_like_design.dart';
import 'package:get/get.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kWhiteColor,
        elevation: 0,
        title: const Text(
          'my',
          style: TextStyle(
            color: kSelectedColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/user_image_1.jpeg'),
                    ),
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(color: kUnSelectedColor),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      //TODO user name/user email db필요
                      Text(
                        '배고픈 디자이너 #1',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('asd123@naver.com'),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: kUnSelectedColor,
                  width: 2,
                ),
                bottom: BorderSide(
                  color: kUnSelectedColor,
                  width: 2,
                ),
              ),
            ),
            child: Row(
              children: [
                UserScreenLikeButton(
                  onPressed: () {
                    Get.to(() => const UserScreenLikeDesigner());
                  },
                  icon: Icons.thumb_up_outlined,
                  iconColor: Colors.blue,
                  title: '구독',
                  size: size,
                ),
                UserScreenLikeButton(
                  onPressed: () {
                    Get.to(() => UserScreenLikeDesign());
                  },
                  icon: Icons.favorite_outline,
                  iconColor: Colors.red,
                  title: '찜',
                  size: size,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                UserScreenInfoCard(title: '공지사항'),
                UserScreenInfoCard(title: '1:1 문의'),
                UserScreenInfoCard(title: '이용약관'),
                UserScreenInfoCard(title: '친구 초대하기'),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    '버전 1.0.0',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
