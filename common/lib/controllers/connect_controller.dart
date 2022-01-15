import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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
}
