import 'package:flutter/material.dart';

class GatheringCardTag extends StatelessWidget {
  final List tagList;
  const GatheringCardTag({
    Key? key,
    required this.tagList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
    children: tagList.map((e){
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Text('#$e'),
      );
    }).toList(),
    );
  }
}
