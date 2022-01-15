import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../../../utils.dart';
import '../../../constants.dart';

class UploadScreenDateTimePicker extends StatelessWidget {
  final DateTime nowTime;
  final DateTime currentTime;
  final Function onSubmitted;
  final bool noEnd;
  const UploadScreenDateTimePicker({
    Key? key,
    required this.nowTime,
    required this.currentTime,
    required this.onSubmitted,
    required this.noEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (!noEnd) {
            DatePicker.showDateTimePicker(
              context,
              showTitleActions: true,
              locale: LocaleType.ko,
              minTime: nowTime,
              maxTime: DateTime(2022, 12, 31),
              onConfirm: (DateTime date){
                onSubmitted(date);
              }
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            border: Border.all(
              color: kGreyColor,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${currentTime.year}.${getTime(currentTime.month)}.${getTime(currentTime.day)} (${kWeekDay[currentTime.weekday]})',
                style: TextStyle(
                  color: noEnd ? kGreyColor : kBlackColor,
                ),
              ),
              Text(
                '${getTime(currentTime.hour)} : ${getTime(currentTime.minute)}',
                style: TextStyle(
                  color: noEnd ? kGreyColor : kBlackColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
