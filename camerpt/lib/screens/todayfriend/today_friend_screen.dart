import 'package:camerpt/components/screen_title.dart';
import 'package:camerpt/models/friend.dart';
import 'package:camerpt/screens/todayfriend/components/today_friend_screen_card.dart';
import 'package:flutter/material.dart';

class TodayFriendScreen extends StatelessWidget {
  final List<Friend> todayFriendList;
  const TodayFriendScreen({
    Key? key,
    required this.todayFriendList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ScreenTitle(title: '오늘의 친구'),
      body: ListView(
        children: todayFriendList.map((Friend friend) {
          return TodayFriendScreenCard(
            friend: friend,
            imageUrl: friend.imageUrl,
            name: friend.name,
            gameList: friend.gameList,
          );
        }).toList(),
      ),
    );
  }
}
