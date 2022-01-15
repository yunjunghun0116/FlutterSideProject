import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../components/gathering_card_tag.dart';

class ProfileScreenEditScreenInfoTagCard extends StatelessWidget {
  final String title;
  final List tagList;
  final Function onPressed;
  const ProfileScreenEditScreenInfoTagCard({
    Key? key,
    required this.title,
    required this.tagList,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: GestureDetector(
            onTap: () {
              onPressed();
            },
            child: Container(
                padding: const EdgeInsets.only(bottom: 5),
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: kGreyColor,
                    ),
                  ),
                ),
                child: GatheringCardTag(
                  tagList: tagList,
                )),
          ),
        )
      ],
    );
  }
}
