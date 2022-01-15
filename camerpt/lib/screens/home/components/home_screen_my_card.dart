import 'package:flutter/material.dart';
import '../../../constants.dart';

class HomeScreenMyCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final List<String> gameList;
  const HomeScreenMyCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.gameList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
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
                fontSize: 16,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            child: Row(
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
          ),
        ],
      ),
    );
  }
}
