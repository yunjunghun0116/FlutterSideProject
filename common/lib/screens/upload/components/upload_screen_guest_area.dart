import 'package:flutter/material.dart';
import '../../../constants.dart';

class UploadScreenGuestArea extends StatelessWidget {
  final int guestCount;
  final Function onChanged;
  const UploadScreenGuestArea({
    Key? key,
    required this.guestCount,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: kBlackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(text: '참여 인원수'),
                    TextSpan(
                      text: '(최대 50명)',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '$guestCount 명',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        SliderTheme(
          data: const SliderThemeData(
            trackHeight: 15,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
          ),
          child: Slider(
            min: 1,
            max: 50,
            value: guestCount.toDouble(),
            onChanged: (double value) {
              onChanged(value);
            },
            inactiveColor: kGreyColor,
            activeColor: kYellowColor,
          ),
        ),
      ],
    );
  }
}
