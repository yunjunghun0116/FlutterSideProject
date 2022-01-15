import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../design/design_screen.dart';
import '../../../components/artist_card.dart';
import '../../../controller/designer_controller.dart';
import '../../../models/designer.dart';

class HomeScreenFilteredArtistArea extends StatelessWidget {
  HomeScreenFilteredArtistArea({Key? key}) : super(key: key);

  final DesignerController _designerController = DesignerController.to;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
      _designerController.designerList.map((Designer designer) {
        return GestureDetector(
          //TODO 여기서 디자인화면 넘어가는부분 처리
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
      }).toList(),
    );
  }
}
