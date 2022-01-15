import 'package:flutter/material.dart';

List<String> kAdvertisementImageList = [
  'assets/images/ad_image_1.jpeg',
  'assets/images/ad_image_2.jpeg',
  'assets/images/ad_image_3.jpeg',
  'assets/images/ad_image_4.jpeg',
  'assets/images/ad_image_5.jpeg'
];

const Color kWhiteColor = Color(0xFFFAFAFA);
const Color kSelectedColor = Color(0xFF000000);
const Color kUnSelectedColor = Color(0x50808080);
const Color kRedColor = Color(0xFFFF8080);
const Color kBlueColor = Color(0xFF4DA3FF);
const Color kOrangeColor = Color(0xFFFFB800);

Widget kFollowButton = Container(
  padding: const EdgeInsets.all(5),
  decoration: BoxDecoration(
    color: kRedColor,
    borderRadius: BorderRadius.circular(5),
  ),
  child: const Text(
    '구독하기',
    style: TextStyle(
      fontSize: 18,
      color: kWhiteColor,
    ),
  ),
);
Widget kChatButton = Container(
  padding: const EdgeInsets.all(5),
  decoration: BoxDecoration(
    color: kBlueColor,
    borderRadius: BorderRadius.circular(5),
  ),
  child: const Text(
    '채팅하기',
    style: TextStyle(color: kWhiteColor),
  ),
);
String kGetCountString(int count){
  if(count < 1000){
    return '$count';
  }else if(count < 10000){
    return '${(count/1000).toStringAsFixed(1)}천';
  }else{
    return '${(count/10000).toStringAsFixed(1)}만';
  }
}





