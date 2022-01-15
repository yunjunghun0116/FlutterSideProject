import 'package:flutter/material.dart';
import '../../../components/gathering_card_tag.dart';

class DetailScreenGatheringHashTag extends StatelessWidget {
  final List tagList;
  const DetailScreenGatheringHashTag({
    Key? key,
    required this.tagList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '선호 해시태그',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 5),
          GatheringCardTag(tagList: tagList),
        ],
      ),
    );
  }
}
