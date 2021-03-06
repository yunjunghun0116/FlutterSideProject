import 'package:flutter/material.dart';

const Color kWhiteColor = Color(0xFFFAFAFA);
const Color kBlackColor = Color(0xFF000000);
final Color kBlackColorWithOpacity = const Color(0xFF000000).withOpacity(0.3);
const Color kDeepBlueColor = Color(0xFF1D4EFF);
const Color kBlueColor = Color(0xFF51B6FF);
const Color kGreyColor = Color(0xFF979797);
const Color kDarkGreyColor = Color(0xFF696969);
const Color kLightGreyColor = Color(0xFFF2F2F8);
const Color kRedColor = Color(0xFFFF0000);
const Color kYellowColor = Color(0xFFFFB800);
const Color kPinkColor = Color(0xFFFF7878);
const Color kGreenColor = Color(0xFF81C147);
const Color kShimmerColor = Color(0x80979797);
const Color kPurpleColor = Color(0xFFBA55D3);
const Color kMainColor = Color(0xFF07BBBB);
const Color kSplashBackgroundColor = Color(0xFFFAFAFA);

const Color kWhiteColorE7 = Color(0xFFE7E8EA);

const String kNaverServiceId = 'ncp:sms:kr:272033493278:common'; //sms
const String kNaverAccessKey = 'zjOM8XgBcfQ2NdUBwEVM';
const String kNaverSecretKey = 'xcCu4cBzvoRbChlXXroyOBDoAtzdTxpLaqW7XVAi';

const String kKakaoNativeAppKey = 'bec270e317eab64305f8cd133629425c';
const String kKakaoJavascriptKey = '2131640029245d00c061ebaa49598053';
const String kKakaoRestApiKey = 'a33bed6fb12716b0522c1a1685377dfa';

String noPerson =
    'https://firebasestorage.googleapis.com/v0/b/common-53a17.appspot.com/o/images%2Fno_user.png?alt=media&token=3b0c3d21-c00f-4926-9287-aee79abded29';

const BoxDecoration kBottomBarDecoration = BoxDecoration(
  color: kWhiteColor,
  boxShadow: [
    BoxShadow(
      color: kLightGreyColor,
      offset: Offset(0, -2),
      blurRadius: 1,
    ),
  ],
);

const TextStyle kDisabledTextStyle = TextStyle(
  fontSize: 14,
  color: kRedColor,
);

const TextStyle kEnabledTextStyle = TextStyle(
  fontSize: 14,
  color: kMainColor,
);

const TextStyle kCommunityTextStyle = TextStyle(
  fontSize: 16,
  color: kDarkGreyColor,
);

const UnderlineInputBorder kRedUnderlineBorder = UnderlineInputBorder(
  borderSide: BorderSide(
    color: kRedColor,
    width: 1.5,
  ),
);

const UnderlineInputBorder kEnableUnderlineBorder = UnderlineInputBorder(
  borderSide: BorderSide(
    color: kMainColor,
    width: 1.5,
  ),
);

OutlineInputBorder kGreyOutlinedBorder = OutlineInputBorder(
  borderSide: const BorderSide(
    color: kGreyColor,
  ),
  borderRadius: BorderRadius.circular(10.0),
);

OutlineInputBorder kFocusOutlinedBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: kBlackColor, width: 1.5),
  borderRadius: BorderRadius.circular(10.0),
);

const List<Map<String, dynamic>> kCommunityCategoryList = [
  {
    'title': '자유게시판',
    'color': kMainColor,
    'icon': Icons.widgets,
  },
  {
    'title': '질문게시판',
    'color': kGreenColor,
    'icon': Icons.question_mark,
  },
  {
    'title': '운동게시판',
    'color': kBlueColor,
    'icon': Icons.sports_tennis,
  },
  {
    'title': '봉사정보게시판',
    'color': kYellowColor,
    'icon': Icons.volunteer_activism,
  },
];

const List<Map<String, dynamic>> kDetailStateList = [
  {'guideLine': '', 'buttonText': '신청하기'},
  {'guideLine': '모임에 신청중입니다', 'buttonText': '모임 신청중...'},
  {'guideLine': '모임신청 승인되었습니다', 'buttonText': '모임신청 취소'},
  {'guideLine': '취소 요청중입니다', 'buttonText': '취소 요청중...'},
  {'guideLine': '모임이 취소되었습니다', 'buttonText': '모임 취소'}
];

const List<String> kWeekDay = ['', '월', '화', '수', '목', '금', '토', '일'];
const List<String> kPhoneNumberList = [
  '010',
  '011',
  '016',
  '017',
  '018',
  '019'
];

final List<String> kAdvertisementImageList = [
  'assets/images/cafe_1.jpeg',
  'assets/images/study_1.jpeg',
  'assets/images/study_2.jpeg',
  'assets/images/travel_1.jpeg',
  'assets/images/travel_2.jpeg',
  'assets/images/exercise_1.jpeg',
];
final List<Map<String, dynamic>> kCategoryList = [
  {'title': '여행', 'icon': Icons.flight},
  {'title': '운동', 'icon': Icons.sports_tennis},
  {'title': '사교ㆍ인맥', 'icon': Icons.local_cafe},
  {'title': '스터디', 'icon': Icons.edit},
  {'title': '맛집ㆍ카페', 'icon': Icons.restaurant_menu},
  {'title': '요리ㆍ제조', 'icon': Icons.cookie},
  {'title': '게임', 'icon': Icons.sports_esports},
  {'title': '사진', 'icon': Icons.camera_alt},
  {'title': '책ㆍ글쓰기', 'icon': Icons.menu_book},
  {'title': '봉사활동', 'icon': Icons.volunteer_activism},
  {'title': '캠핑', 'icon': Icons.outdoor_grill},
  {'title': '영화ㆍ드라마', 'icon': Icons.movie_creation},
  {'title': '기타', 'icon': Icons.widgets},
];

final List<Map<String, dynamic>> kCityList = [
  {
    'city': '서울특별시',
    'town': [
      '종로구',
      '중구',
      '용산구',
      '성동구',
      '광진구',
      '동대문구',
      '중랑구',
      '성북구',
      '강북구',
      '도봉구',
      '노원구',
      '은평구',
      '서대문구',
      '마포구',
      '양천구',
      '강서구',
      '구로구',
      '금천구',
      '영등포구',
      '동작구',
      '관악구',
      '서초구',
      '강남구',
      '송파구',
      '강동구',
    ],
  },
  {
    'city': '경기도',
    'town': [
      '수원시',
      '성남시',
      '고양시',
      '용인시',
      '부천시',
      '안산시',
      '안양시',
      '남양주시',
      '화성시',
      '평택시',
      '의정부시',
      '시흥시',
      '파주시',
      '광명시',
      '김포시',
      '군포시',
      '광주시',
      '이천시',
      '양주시',
      '오산시',
      '구리시',
      '안성시',
      '포천시',
      '의왕시',
      '하남시',
      '여주시',
      '양평군',
      '동두천시',
      '과천시',
      '가평군',
      '연천군',
    ],
  },
  {
    'city': '부산광역시',
    'town': [
      '중구',
      '서구',
      '동구',
      '영도구',
      '부산진구',
      '동래구',
      '남구',
      '북구',
      '해운대구',
      '사하구',
      '금정구',
      '강서구',
      '연제구',
      '수영구',
      '사상구',
      '기장군',
    ],
  },
  {
    'city': '대구광역시',
    'town': [
      '중구',
      '동구',
      '서구',
      '남구',
      '북구',
      '수성구',
      '달서구',
      '달성군',
    ],
  },
  {
    'city': '인천광역시',
    'town': [
      '중구',
      '동구',
      '미추홀구',
      '연수구',
      '남동구',
      '부평구',
      '계양구',
      '서구',
      '강화군',
      '웅진군',
    ],
  },
  {
    'city': '광주광역시',
    'town': [
      '동구',
      '서구',
      '남구',
      '북구',
      '광산구',
    ],
  },
  {
    'city': '대전광역시',
    'town': [
      '동구',
      '중구',
      '서구',
      '유성구',
      '대덕구',
    ],
  },
  {
    'city': '울산광역시',
    'town': [
      '중구',
      '남구',
      '동구',
      '북구',
      '울주군',
    ],
  },
  {
    'city': '세종특별자치시',
    'town': ['전체'],
  },
  {
    'city': '강원도',
    'town': [
      '춘천시',
      '원주시',
      '강릉시',
      '동해시',
      '태백시',
      '속초시',
      '삼척시',
      '홍천군',
      '횡성군',
      '영월군',
      '평창군',
      '정선군',
      '철원군',
      '화천군',
      '양구군',
      '인제군',
      '고성군',
      '양양군',
    ],
  },
  {
    'city': '충청북도',
    'town': [
      '청주시',
      '충주시',
      '제천시',
      '보은군',
      '옥천군',
      '영동군',
      '증평군',
      '진천군',
      '괴산군',
      '음성군',
      '단양군',
    ],
  },
  {
    'city': '충청남도',
    'town': [
      '천안시',
      '공주시',
      '보령시',
      '아산시',
      '서산시',
      '논산시',
      '당진시',
      '계룡시',
      '금산군',
      '부여군',
      '서천군',
      '청양군',
      '홍성군',
      '예산군',
      '태안군',
    ],
  },
  {
    'city': '전라북도',
    'town': [
      '전주시',
      '군산시',
      '익산시',
      '정읍시',
      '남원시',
      '김제시',
      '완주군',
      '진안군',
      '무주군',
      '장수군',
      '임실군',
      '순창군',
      '고창군',
      '부안군',
    ],
  },
  {
    'city': '전라남도',
    'town': [
      '목포시',
      '여수시',
      '순천시',
      '나주시',
      '광양시',
      '담양군',
      '곡성군',
      '구례군',
      '고흥군',
      '보성군',
      '화순군',
      '장흥군',
      '강진군',
      '해남군',
      '영암군',
      '무안군',
      '함평군',
      '영광군',
      '장성군',
      '완도군',
      '진도군',
      '신안군',
    ],
  },
  {
    'city': '경상북도',
    'town': [
      '포항시',
      '경주시',
      '김천시',
      '안동시',
      '구미시',
      '영주시',
      '영천시',
      '상주시',
      '문경시',
      '경산시',
      '군위군',
      '의성군',
      '청송군',
      '영양군',
      '영덕군',
      '청도군',
      '고령군',
      '성주군',
      '칠곡군',
      '예천군',
      '봉화군',
      '울진군',
      '울릉군',
    ],
  },
  {
    'city': '경상남도',
    'town': [
      '창원시',
      '진주시',
      '통영시',
      '사천시',
      '김해시',
      '밀양시',
      '거제시',
      '양산시',
      '의령군',
      '함안군',
      '창녕군',
      '고성군',
      '남해군',
      '하동군',
      '산청군',
      '함양군',
      '거창군',
      '합천군',
    ],
  },
  {
    'city': '제주특별자치도',
    'town': [
      '제주시',
      '서귀포시',
    ],
  },
];
