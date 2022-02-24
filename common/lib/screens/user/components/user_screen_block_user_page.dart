import 'package:common/controllers/user_controller.dart';
import 'package:common/models/user.dart';
import 'package:common/screens/user/components/user_screen_block_user_page_user_card.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class UserScreenBlockUserPage extends StatelessWidget {
  const UserScreenBlockUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 1,
        title: const Text('차단한 유저 목록'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: StreamBuilder(
          stream: UserController.to.getUserStream(UserController.to.user!.id),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              List blockUser = snapshot.data['blockUser'];
              return Column(
                children: blockUser.map((userId) {
                  return FutureBuilder(
                    future: UserController.to.getUser(userId),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        User user = snapshot.data;
                        return UserScreenBlockUserPageUserCard(user: user);
                      }
                      return Container();
                    },
                  );
                }).toList(),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
