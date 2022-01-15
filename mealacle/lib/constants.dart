import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const kBackgroundColor = Color(0xFFFDE792);
const kTextColor = Color(0xFF3F4346);
const kTextfieldBackgroundColor = Color(0xFFACAAAB);
const kSelectedColor = Color(0xFFFDD100);
const kOrderTextColor = Color(0xFFF98C00);
const kFinishedColor = Color(0xFF70AD47);

Divider kDivider(double thickness) {
  return Divider(
    thickness: thickness,
    color: kTextColor,
  );
}

String kPriceComma(String price){
  return NumberFormat('###,###,###,###')
      .format(int.parse(price))
      .replaceAll(' ', '');
}

const Map<String, dynamic> kUniversity = {
  '서울': ['서울대학교', '고려대학교', '연세대학교'],
  '인천': ['인천대학교'],
  '경기': ['경기대학교', '경기과학기술대학교', '아주대학교', '서울예술대학교', '단국대학교'],
  '대전': ['충남대학교-대덕캠퍼스', 'KAIST', '한밭대학교', '한남대학교', '우송대학교', '대전대학교'],
  '세종': ['한국영상대학교', '고려대학교-세종캠퍼스'],
  '광주': ['광주과학기술원', '전남대학교-용봉캠퍼스'],
  '대구': ['경북대학교-대구캠퍼스', '대구과학대학교', '대구교육대학교', '대구보건대학교', '대구경북과학기술원'],
  '울산': ['울산대학교', 'UNIST-울산과학기술원', '울산과학대학교'],
  '부산': ['부산대학교', '부산외국어대학교', '부산과학기술대학교', '경성대학교', '동아대학교'],
  '제주': ['제주대학교', '탐라대학교', '제주국제대학교'],
  '강원': ['강원대학교-춘천캠퍼스', '강릉원주대학교', '경동대학교', '연세대학교-미래캠퍼스'],
  '충북': ['충북대학교', '충북도립대학교', '충청대학교', '청주대학교'],
  '충남': ['충남도립대학교', '공주대학교', '순천향대학교', '건양대학교-논산캠퍼스'],
  '전북': ['전북대학교-전주캠퍼스', '전북과학대학교', '전주대학교', '군산대학교', '원광대학교'],
  '전남': ['전남과학대학교', '전남도립대학교', '순천대학교', '전남대학교'],
  '경북': ['경북전문대학교', '금오공과대학교', '대구대학교', '영남대학교'],
  '경남': ['경남대학교', '경상국립대학교', '창원대학교', '마산대학교'],
};

const List kCategoryList = [
  [0,'한식', 'assets/icons/hansik.png'],
  [1,'중식', 'assets/icons/jungsik.png'],
  [2,'카페·브런치', 'assets/icons/caffee.png'],
  [3,'일식', 'assets/icons/illsik.png'],
  [4,'아시안', 'assets/icons/asian.png'],
  [5,'분식', 'assets/icons/bunsik.png'],
  [6,'양식', 'assets/icons/yangsik.png'],
  [7,'탕·찌개', 'assets/icons/tang.png'],
  [8,'야식', 'assets/icons/yasik.png'],
];
