import 'package:flutter/material.dart';
import '../../../components/artist_nail_card.dart';
import '../../../controller/designer_controller.dart';
import '../../../models/designer.dart';

class CategoryScreenMonthSpecialNail extends StatelessWidget {
  CategoryScreenMonthSpecialNail({Key? key}) : super(key: key);

  final DesignerController _designerController = DesignerController.to;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '이달의 아트',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: const [
                  Text(
                    '전체보기',
                    style: TextStyle(color: Colors.blue),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.blue,
                  ),
                ],
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                _designerController.designerList.map((Designer designer) {
              return Row(
                children: designer.designList.map((String imageUrl) {
                  return ArtistNailCard(
                    designerName: designer.designerName,
                    shopAddress: designer.shopAddress,
                    imageUrl: imageUrl,
                    isBig: true,
                  );
                }).toList(),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
