import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
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

Future<List> getDataWithKakaoApi(String query) async {
  try {
    var response = await http.get(
      Uri.parse(
          'https://dapi.kakao.com/v2/local/search/keyword.json?analyze_type=exact&query=$query&size=15'),
      headers: {'Authorization': 'KakaoAK $kKakaoRestApiKey'},
    );
    List _results = jsonDecode(response.body)['documents'];
    List _returnList = _results.map((var e) {
      return {
        'place_name': e['place_name'],
        'address_name': e['address_name'],
      };
    }).toList();
    return _returnList;
  } catch (e) {
    return [];
  }
}

String getNaverCloudSignatureKey(
    String serviceId, String timeStamp, String accessKey, String secretKey) {
  String space = ' '; // one space
  String newLine = '\n'; // new line
  String method = 'POST'; // method
  String url = '/sms/v2/services/$serviceId/messages';

  StringBuffer buffer = StringBuffer();
  buffer.write(method);
  buffer.write(space);
  buffer.write(url);
  buffer.write(newLine);
  buffer.write(timeStamp);
  buffer.write(newLine);
  buffer.write(accessKey);

  /// signing key
  var key = utf8.encode(secretKey);
  var signingKey = Hmac(sha256, key);

  var bytes = utf8.encode(buffer.toString());
  var digest = signingKey.convert(bytes);
  String signatureKey = base64.encode(digest.bytes);
  return signatureKey;
}

Future<void> sendSMS(String phoneNumber, String certificationNumber) async {
  Map data = {
    "type": "SMS",
    "contentType": "COMM",
    "countryCode": "82",
    "from": "01037058825", //여기는 발신번호
    "content": "인증번호",
    "messages": [
      {
        "to": phoneNumber, //수신자 번호
        "content": "[Common]인증번호는[$certificationNumber]입니다", //내용
      }
    ],
  };
  String timeStamp = (DateTime.now().millisecondsSinceEpoch).toString();
  await http.post(
    Uri.parse(
        'https://sens.apigw.ntruss.com/sms/v2/services/$kNaverServiceId/messages'),
    headers: {
      "accept": "application/json",
      'content-Type': 'application/json; charset=UTF-8',
      'x-ncp-apigw-timestamp': timeStamp,
      'x-ncp-iam-access-key': kNaverAccessKey,
      'x-ncp-apigw-signature-v2': getNaverCloudSignatureKey(
        kNaverServiceId,
        timeStamp,
        kNaverAccessKey,
        kNaverSecretKey,
      ),
    },
    body: json.encode(data),
  );
}
