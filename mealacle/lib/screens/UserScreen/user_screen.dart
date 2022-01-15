import 'package:flutter/material.dart';
import '../../constants.dart';
import 'components/user_button_area.dart';
import 'components/user_info_area.dart';
import 'components/user_row_card.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          '내 정보',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserInfoArea(),
            kDivider(1),
            const UserButtonArea(),
            kDivider(1),
            UserRowCard(
              title: '공지사항',
              onClicked: () {},
            ),
            UserRowCard(
              title: '이벤트',
              onClicked: () {},
            ),
            UserRowCard(
              title: '고객센터',
              onClicked: () {},
            ),
            UserRowCard(
              title: '환경설정',
              onClicked: () {},
            ),
            UserRowCard(
              title: '약관 및 정책',
              onClicked: () {},
            ),
            kDivider(1),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10),
              child: const Text('현재 버전 1.0.0'),
            ),
          ],
        ),
      ),
    );
  }
}
