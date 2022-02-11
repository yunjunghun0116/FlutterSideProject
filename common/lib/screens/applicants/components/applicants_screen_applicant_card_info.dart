import 'package:flutter/material.dart';
import '../../../components/gathering_card_tag.dart';
import '../../../constants.dart';

class ApplicantsScreenApplicantCardInfo extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String job;
  final List userTagList;
  final bool followed;
  const ApplicantsScreenApplicantCardInfo({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.job,
    required this.userTagList, required this.followed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: kBlackColor, fontSize: 16),
                    children: [
                      TextSpan(
                          text: name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          )),
                      TextSpan(text: job!=''?' | $job':''),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                GatheringCardTag(tagList: userTagList),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
