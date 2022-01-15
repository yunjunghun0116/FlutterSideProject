import 'package:camerpt/components/add_friend_screen.dart';
import 'package:camerpt/models/friend.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class TodayFriendScreenCard extends StatelessWidget {
  final Friend friend;
  final String imageUrl;
  final String name;
  final List<String> gameList;
  const TodayFriendScreenCard(
      {Key? key,
      required this.friend,
      required this.imageUrl,
      required this.name,
      required this.gameList,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>AddFriendScreen(friend: friend));
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              offset: Offset(3,3),
              color: Colors.blue
            )
          ]
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: gameList.map((String game) {
                String? _gameImage;
                switch (game) {
                  case kLeagueOfLegends:
                    _gameImage = 'assets/icons/league_of_legends_logo.png';
                    break;
                  case kBattleGrounds:
                    _gameImage = 'assets/icons/battle_ground_logo.png';
                    break;
                  case kOverWatch:
                    _gameImage = 'assets/icons/over_watch_logo.png';
                    break;
                  default:
                    break;
                }
                if (_gameImage == null) {
                  return Container();
                }
                return Container(
                  width: 50,
                  height: 30,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(_gameImage),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
