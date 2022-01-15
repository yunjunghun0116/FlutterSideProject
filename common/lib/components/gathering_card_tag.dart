import 'package:flutter/material.dart';

class GatheringCardTag extends StatelessWidget {
  final List tagList;
  const GatheringCardTag({
    Key? key,
    required this.tagList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String tagString = '';
    for (String s in tagList) {
      tagString = tagString + '#$s ';
    }
    return Text(
      tagString,
      softWrap: true,
    );
  }
}
