import 'package:flutter/material.dart';
import 'components/follow_screen_card_button_area.dart';
import '../../components/user_info.dart';
import '../../constants.dart';

class FollowScreen extends StatelessWidget {
  final List followUserList;
  const FollowScreen({
    Key? key,
    required this.followUserList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        centerTitle: false,
        elevation: 1,
        title: const Text(
          '팔로우',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        children: followUserList.map((user) {
          return Column(
            children: [
              UserInfo(
                userId: user.id,
                imageUrl: user.imageUrl,
                name: user.name,
                job: user.job,
                hostTagList: user.userTagList,
              ),
              FollowScreenCardButtonArea(
                chatPressed: () {},
                detailPressed: () {},
              ),
              const Divider(),
            ],
          );
        }).toList(),
      ),
    );
  }
}
