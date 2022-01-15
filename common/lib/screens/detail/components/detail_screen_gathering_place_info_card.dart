import 'package:flutter/material.dart';

class DetailScreenGatheringPlaceInfoCard extends StatelessWidget {
  final IconData icon;
  final String content;
  const DetailScreenGatheringPlaceInfoCard({
    Key? key,
    required this.icon,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Expanded(
            child: Text(content),
          ),
        ],
      ),
    );
  }
}
