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
    return GestureDetector(
      onTap: ()=> onPressed(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
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
            child: Container(
              margin: const EdgeInsets.only(left: 10,right: 10,bottom: 5),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(
                color: kSplashBackgroundColor,
                border: Border(
                  bottom: BorderSide(
                    color: kGreyColor,
                  ),
                ),
              ),
              child: GatheringCardTag(
                tagList: tagList,
              ),
            ),
          )
        ],
      ),
    );
  }
}
