import '../constants.dart';
import 'package:flutter/material.dart';

class GameArea extends StatelessWidget {
  final List<String> gameList;
  final Map<String, dynamic> tier;
  const GameArea({
    Key? key,
    required this.gameList,
    required this.tier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          width: double.infinity,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: kUnSelectedColor,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: gameList.map((String game) {
              String? _gameImage;
              String? _gameName;

              switch (game) {
                case kLeagueOfLegends:
                  _gameImage = 'assets/icons/league_of_legends_logo.png';
                  _gameName = 'leagueOfLegends';
                  break;
                case kBattleGrounds:
                  _gameImage = 'assets/icons/battle_ground_logo.png';
                  _gameName = 'battleGrounds';
                  break;
                case kOverWatch:
                  _gameImage = 'assets/icons/over_watch_logo.png';
                  _gameName = 'overWatch';
                  break;
                default:
                  break;
              }
              if (_gameImage == null) {
                return Container();
              }
              return Column(
                children: [
                  Container(
                    width: 60,
                    height: 40,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(_gameImage),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  _gameName == 'battleGrounds'
                      ? Text('${tier[_gameName]}점')
                      : Text(tier[_gameName]),
                ],
              );
            }).toList(),
          )),
    );
  }
}
