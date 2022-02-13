import 'package:flutter/material.dart';
import '../../../constants.dart';

class DetailScreenGatheringInfoCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  final Color iconColor;
  const DetailScreenGatheringInfoCard({
    Key? key,
    required this.title,
    required this.content,
    required this.icon,
    this.iconColor = kBlackColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Icon(
                icon,
                color: iconColor,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(content),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
