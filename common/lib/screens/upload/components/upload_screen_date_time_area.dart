import 'package:flutter/material.dart';
import 'upload_screen_date_time_picker.dart';
import 'upload_screen_icon_text.dart';

class UploadScreenDateTimeArea extends StatelessWidget {
  final bool noEnd;
  final DateTime nowTime;
  final DateTime openTime;
  final DateTime endTime;
  final Function noEndPressed;
  final Function openPressed;
  final Function endPressed;

  const UploadScreenDateTimeArea({
    Key? key,
    required this.noEnd,
    required this.nowTime,
    required this.openTime,
    required this.endTime,
    required this.noEndPressed,
    required this.openPressed,
    required this.endPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const UploadScreenIconText(
          title: '날짜/시간',
          icon: Icons.event_available,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              UploadScreenDateTimePicker(
                nowTime: nowTime,
                currentTime: openTime,
                onSubmitted: (DateTime date) {
                  openPressed(date);
                },
                noEnd: false,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: const Text(
                  '~',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              UploadScreenDateTimePicker(
                nowTime: nowTime,
                currentTime: endTime,
                onSubmitted: (DateTime date) {
                  endPressed(date);
                },
                noEnd: noEnd,
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            noEndPressed();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              noEnd
                  ? const Icon(Icons.check_box_outlined)
                  : const Icon(Icons.check_box_outline_blank),
              const Text('종료 시간 미정'),
            ],
          ),
        ),
      ],
    );
  }
}
