import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/friend.dart';
import '../../friend/friend_screen.dart';
import '../../../constants.dart';

class HomeScreenFriendCard extends StatelessWidget {
  final Friend friend;
  final String imageUrl;
  final String name;
  final List<String> gameList;
  const HomeScreenFriendCard({
    Key? key,
    required this.friend,
    required this.imageUrl,
    required this.name,
    required this.gameList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(()=>FriendScreen(friend: friend));
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
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
