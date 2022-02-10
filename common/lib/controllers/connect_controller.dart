import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class ConnectController extends GetxController {
  static ConnectController get to => Get.find();
  final String kakaoApiKey = 'a33bed6fb12716b0522c1a1685377dfa';

  Future<List> getDataWithKakaoApi(String query) async {
    var response = await http.get(
      Uri.parse(
          'https://dapi.kakao.com/v2/local/search/keyword.json?analyze_type=exact&page=1&size=10&query=$query'),
      headers: {'Authorization': 'KakaoAK $kakaoApiKey'},
    );
    List _results = jsonDecode(response.body)['documents'];
    List _returnList = _results.map((var e){
      return {
        'place_name':e['place_name'],
        'address_name':e['address_name'],
      };
    }).toList();
    return _returnList;
  }

  String getNaverCloudSignatureKey(String serviceId,String timeStamp,String accessKey,String secretKey){
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

  Future<void> sendSMS(String phoneNumber,String certificationNumber) async {
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
}
