import 'dart:convert';

import 'package:bookchigo/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ConnectController extends GetxController {
  static ConnectController get to => Get.find();

  void searchBook({required String query, int currentPage = 1}) async {
    var response = await http.get(
      Uri.parse(
          'https://openapi.naver.com/v1/search/book.json?query=$query&display=10&start=100'),
      headers: {
        'X-Naver-Client-Id': kNaverClientId,
        'X-Naver-Client-Secret': kNaverClientSecret,
      },
    );
    Map<String, dynamic> bookData = jsonDecode(response.body);
    List books = bookData['items'];
    books.forEach((element) {
      print(element['title'].replaceAll('<b>', '').replaceAll('<\/b>', ''));
    });
  }
}
