import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../design/design_screen.dart';
import '../../../models/designer.dart';
import '../../../components/artist_card.dart';

class HomeScreenRecommendArtistArea extends StatelessWidget {
  final String title;
  final List<Designer> designerList;
  const HomeScreenRecommendArtistArea({
    Key? key,
    required this.designerList,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: const [
                    Text(
                      '전체보기',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.blue,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Column(
          children: designerList
              .map((Designer designer) {
                return GestureDetector(
                  //TODO 여기서도 디자인 넘어가는부분 처리하기
                  onTap: (){
                    Get.to(()=>const DesignScreen());
                  },
                  child: ArtistCard(
                    designer: designer,
                    imageUrl: designer.imageUrl,
                    designerName: designer.designerName,
                    shopName: designer.shopName,
                    shopAddress: designer.shopAddress,
                    portfolioCount: designer.portfolioCount,
                    viewCount: designer.viewCount,
                    likeCount: designer.likeCount,
                    designList: designer.designList,
                  ),
                );
                //TODO 여기에서 몇개를 띄워줄지 정하는 부분
              })
              .toList()
              .sublist(0, 3),
        ),
      ],
    );
  }
}
