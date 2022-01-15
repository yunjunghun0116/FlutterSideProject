import 'package:camerpt/components/screen_title.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../controllers/friend_controller.dart';
import 'components/home_screen_friend_area.dart';
import 'components/home_screen_my_card.dart';
import 'components/home_screen_sub_title.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final FriendController _controller = FriendController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ScreenTitle(title: '친구'),
      body: ListView(
        children: [
          const HomeScreenSubTitle(title: '나'),
          const HomeScreenMyCard(
            imageUrl: 'assets/images/user_image_1.jpeg',
            name: '정훈',
            gameList: [
              kLeagueOfLegends,
              kBattleGrounds,
              kOverWatch,
            ],
          ),
          const HomeScreenSubTitle(title: '친구'),
          HomeScreenFriendArea(friendList: _controller.friendList),
        ],
      ),
    );
  }
}
