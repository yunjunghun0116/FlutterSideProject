import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../models/designer.dart';
import 'design_screen_card_designer_info.dart';
import 'design_screen_card_price_area.dart';

class DesignScreenCard extends StatelessWidget {
  final Designer designer;
  final String imageUrl;
  const DesignScreenCard(
      {Key? key, required this.designer, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO 서버에서 받아오는 데이터 처리
    // String s = '세종시 세종시 한솔동';
    // List data = s.split(' ');
    // print(data[1]+' '+data[2]);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DesignScreenCardDesignerInfo(designer: designer),
        CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.width,
            viewportFraction: 1,
            autoPlay: false,
            enableInfiniteScroll: false,
          ),
          //TODO 나중에 이미지 리스트로 처리하기
          items: [imageUrl,imageUrl].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: const EdgeInsets.only(top: 5),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        DesignScreenCardPriceArea(designer: designer),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '#화이트 #겨울', //필터기능 하기위한 카테고리
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '한번 각자의 피부톤에 어울리는 네일을 찾아서 받아보세요',
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
          child: Divider(),
        ),
      ],
    );
  }
}
