import 'package:flutter/material.dart';
import '../../../components/artist_nail_card.dart';
import '../../../models/designer.dart';

class ArtistScreenMonthSpecialNail extends StatelessWidget {
  final Designer designer;
  const ArtistScreenMonthSpecialNail({Key? key, required this.designer})
      : super(key: key);

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
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: const [
                  Text(
                    '전체보기',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: designer.designList.map((String imageUrl) {
              return ArtistNailCard(
                designerName: designer.designerName,
                imageUrl: imageUrl,
                shopAddress: designer.shopAddress,
                isBig: true,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
