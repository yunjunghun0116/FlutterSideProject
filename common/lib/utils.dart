import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';

List<String> getDateTime(String openTime, String endTime) {
  if (endTime == '') {
    List<String> _date = openTime.split(' ');
    return [_date[0], _date[1].substring(0, 5)];
  }
  List<String> _openDate = openTime.split(' ');
  List<String> _endDate = endTime.split(' ');
  List<String> _returnDate = [];
  if (_openDate[0] == _endDate[0]) {
    _returnDate.add(_openDate[0]);
  } else {
    _returnDate.add('${_openDate[0]}~${_endDate[0]}');
  }
  int _hours =
      DateTime.parse(endTime).difference(DateTime.parse(openTime)).inHours;
  _returnDate
      .add('${_openDate[1].substring(0, 5)}~${_endDate[1].substring(0, 5)}');
  if (_hours < 1) {
    _returnDate.add(
        '${DateTime.parse(endTime).difference(DateTime.parse(openTime)).inMinutes}분');
  } else if (_hours < 24) {
    _returnDate.add('$_hours시간');
  } else if (_hours < 720) {
    _returnDate.add('${(_hours / 24).floor()}일 ${(_hours % 24).floor()}시간');
  } else {
    _returnDate.add('${(_hours / 720).floor()}개월');
  }
  return _returnDate;
}

String getCertificationTime(int second) {
  if (second <= 0) {
    return '0:00';
  }
  String minutes = (second / 60).floor().toStringAsFixed(0);
  String seconds = (second % 60).toStringAsFixed(0);
  if (seconds.length == 1) {
    seconds = '0$seconds';
  }
  return '$minutes:$seconds';
}

String getNewCertificationNumber() {
  String _newCertificationNumber = '';
  for (int i = 0; i < 4; i++) {
    _newCertificationNumber += Random().nextInt(10).toString();
  }
  return _newCertificationNumber;
}

String getTime(int time) {
  if (time < 10) {
    return '0$time';
  } else {
    return '$time';
  }
}

String getUploadTime(DateTime dateTime) {
  return '${dateTime.month < 10 ? '0${dateTime.month}' : dateTime.month}/${dateTime.day < 10 ? '0${dateTime.day}' : dateTime.day} ${dateTime.hour < 10 ? '0${dateTime.hour}' : dateTime.hour}:${dateTime.minute < 10 ? '0${dateTime.minute}' : dateTime.minute}';
}

Future<void> getDialog({required String title, double? fontSize}) async {
  await Get.dialog(
    Dialog(
      child: SizedBox(
        height: 80,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: fontSize ?? 16,
            ),
          ),
        ),
      ),
    ),
  );
}

Future<void> checkDialog({
  required String title,
  required String sureText,
  required Function onPressed,
}) async {
  await Get.dialog(
    Dialog(
      child: Container(
        height: 140,
        color: kWhiteColor,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: kLightGreyColor,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        color: kWhiteColor,
                        alignment: Alignment.center,
                        child: const Text(
                          '닫기',
                          style: TextStyle(color: kGreyColor),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    color: kLightGreyColor,
                    height: 40,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => onPressed(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        color: kWhiteColor,
                        alignment: Alignment.center,
                        child: Text(sureText),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
