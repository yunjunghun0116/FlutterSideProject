import 'package:flutter/material.dart';
import 'package:freeview/models/designer.dart';
import '../../../components/artist_card.dart';
import 'artist_division_card.dart';

class RecommendArtistArea extends StatelessWidget {
  final List<Designer> designerList;
  const RecommendArtistArea({
    Key? key,
    required this.designerList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ArtistDivisionCard(
          title: '추천 아티스트',
          onPressed: () {},
        ),
        Column(
          children: designerList.map((Designer designer) {
            return ArtistCard(
              imageUrl: designer.imageUrl,
              designerName: designer.designerName,
              shopName: designer.shopName,
              shopAddress: designer.shopAddress,
              distance: 1.5, //Geolocator.distanceBetween(), 사용하기
              portfolioCount: designer.portfolioCount,
              viewCount: designer.viewCount,
              likeCount: designer.likeCount,
              portfolioList: designer.portfolioList,
            );
          }).toList(),
        ),
        // const ArtistCard(
        //   imageUrl:
        //       'https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202104/17/6c0f1c1d-6c28-4734-bef3-a4dd11ebe5df.jpg',
        //   designerName: '라쿤 디자이너',
        //   shopName: '라쿤네일',
        //   shopAddress: '대전 서구 둔산동',
        //   distance: 1.5,
        //   portfolioCount: 100,
        //   viewCount: 2400,
        //   likeCount: 50,
        //   portfolioList: [1, 2, 3],
        // ),
      ],
    );
  }
}
