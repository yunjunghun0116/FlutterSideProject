import 'package:flutter/material.dart';
import 'detail_screen_gathering_place_info_card.dart';

class DetailScreenGatheringPlaceInfo extends StatelessWidget {
  final String location;
  final String locationDetail;
  final String hostMessage;
  const DetailScreenGatheringPlaceInfo({
    Key? key,
    required this.location,
    required this.locationDetail,
    required this.hostMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          DetailScreenGatheringPlaceInfoCard(
              icon: Icons.location_on, content: location),
          DetailScreenGatheringPlaceInfoCard(
              icon: Icons.near_me, content: locationDetail),
          DetailScreenGatheringPlaceInfoCard(
              icon: Icons.chat, content: hostMessage),
        ],
      ),
    );
  }
}
