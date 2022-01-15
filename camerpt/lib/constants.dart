import 'package:flutter/material.dart';

const String kLeagueOfLegends = 'leagueOfLegends';
const String kBattleGrounds = 'battleGrounds';
const String kOverWatch = 'overWatch';

const Color kWhiteColor = Color(0xFFFAFAFA);
const Color kSelectedColor = Color(0xFF000000);
const Color kUnSelectedColor = Color(0x50808080);
const Color kTitleColor = Color(0x7F000000);

const Icon kThumbUpIcon = Icon(
Icons.thumb_up_alt_outlined,
size: 20,
);
const Icon kCommentIcon = Icon(
  Icons.comment_outlined,
  size: 20,
);

const TextStyle kTitleTextStyle = TextStyle(
  color: kSelectedColor,
  fontSize: 20,
  fontWeight: FontWeight.w600,
);
const TextStyle kSubTitleTextStyle = TextStyle(
  color: kTitleColor,
  fontSize: 15,
);

const TextStyle kPostOverviewTitleTextStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w600,
);
const TextStyle kPostOverviewContentTextStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.normal,
);
String getDateRemoveYear(String timeStamp){
  return DateTime.parse(timeStamp).toString().substring(5,16);
}
String getTimeDifference(String timeStamp){
  int minutes = DateTime.now().difference(DateTime.parse(timeStamp)).inMinutes;
  if(minutes<60){
    return '$minutes 분전';
  }else if(DateTime.parse(timeStamp).day == DateTime.now().day){
    DateTime date = DateTime.parse(timeStamp);
    return '${date.hour}:${date.minute}';
  }else {
    String date = timeStamp.substring(5,10);
    List<String> dates = date.split('-');
    return '${int.parse(dates[0])}/${int.parse(dates[1])}';
  }
}

List<String> kLoLTier = [
  '언랭',
  '아이언',
  '브론즈',
  '실버',
  '골드',
  '플레티넘',
  '다이아',
  '마스터',
  '그랜드마스터',
  '챌린저',
];
List<String> kOverwatchTier = [
  '언랭',
  '브론즈',
  '실버',
  '골드',
  '플레티넘',
  '다이아',
  '마스터',
  '그랜드마스터',
];
