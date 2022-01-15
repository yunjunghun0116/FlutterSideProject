import 'package:flutter/material.dart';
import '../../../models/friend.dart';
import 'home_screen_friend_card.dart';

class HomeScreenFriendArea extends StatelessWidget {
  final List<Friend> friendList;
  const HomeScreenFriendArea({
    Key? key,
    required this.friendList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: friendList.map((Friend friend) {
        return HomeScreenFriendCard(
          friend: friend,
          imageUrl: friend.imageUrl,
          name: friend.name,
          gameList: friend.gameList,
        );
      }).toList(),
    );
  }
}
