import 'package:camerpt/components/friend_action_button.dart';
import 'package:camerpt/components/game_area.dart';
import 'package:camerpt/components/info_area.dart';
import 'package:camerpt/components/name_area.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../models/friend.dart';

class FriendScreen extends StatelessWidget {
  final Friend friend;
  const FriendScreen({
    Key? key,
    required this.friend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        foregroundColor: kUnSelectedColor,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: size.width / 1.5,
                height: size.width / 1.5,
                decoration: BoxDecoration(
                  border: Border.all(color: kSelectedColor),
                  borderRadius: BorderRadius.circular(size.width),
                  image: DecorationImage(
                    image: AssetImage(friend.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          NameArea(text: friend.name),
          GameArea(
            gameList: friend.gameList,
            tier: friend.tier,
          ),
          const SizedBox(height: 30),
          InfoArea(
            information: friend.information,
          ),
        ],
      ),
      bottomNavigationBar: FriendActionButton(
        title: '대화하기',
        onPressed: () {},
      ),
    );
  }
}
