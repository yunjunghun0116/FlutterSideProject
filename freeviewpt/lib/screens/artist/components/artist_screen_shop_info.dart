import 'package:flutter/material.dart';
import '../../../models/designer.dart';

class ArtistScreenShopInfo extends StatelessWidget {
  final Designer designer;
  const ArtistScreenShopInfo({Key? key, required this.designer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle customTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    return  Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.location_on,
                  size: 15, color: Colors.redAccent),
              SizedBox(width: 5),
              Text('주소', style: customTextStyle),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Text('${designer.shopAddress}, 7단지 001호'),
                const SizedBox(width: 10),
                const Icon(Icons.text_snippet_outlined,
                    color: Colors.blue),
                const Text('복사',
                    style: TextStyle(color: Colors.blue)),
              ],
            ),
          ),
          Row(
            children: const [
              Icon(Icons.access_time, size: 15),
              SizedBox(width: 5),
              Text('영업 시간', style: customTextStyle),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text('월~토 11:00~21:00, 일 휴무'),
          ),
          Row(
            children: const [
              Icon(Icons.apartment_outlined, size: 15),
              SizedBox(width: 5),
              Text('샵 정보', style: customTextStyle),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TODO 카드 어떤식으로 정돈된 형태로 보여줄것인지
              Row(
                children:
                ['1인샵', '주차', '동물동반', '당일예약','심야영업'].map((e) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 5, vertical: 5),
                    padding: const EdgeInsets.all(5),
                    color: Colors.black.withOpacity(0.6),
                    child: Text(e,
                        style: const TextStyle(color: Colors.white)),
                  );
                }).toList(),
              ),
              Row(
                children: ['1:1시술', '중앙로역 도보 4분'].map((e) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 5, vertical: 5),
                    padding: const EdgeInsets.all(5),
                    color: Colors.black.withOpacity(0.6),
                    child: Text(e,
                        style: const TextStyle(color: Colors.white)),
                  );
                }).toList(),
              ),
            ],
          ),
          Row(
            children: const [
              Icon(Icons.chat_bubble_outline, size: 15),
              SizedBox(width: 5),
              Text('아티스트의 한마디', style: customTextStyle),
            ],
          ),
          Row(
            children: const [
              Expanded(
                child: Text(
                  '깔끔한 디자인과 밝은 피부톤에 어울리는 네일을 제공하겠습니다',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '더보기',
                style: TextStyle(color: Colors.black26),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
