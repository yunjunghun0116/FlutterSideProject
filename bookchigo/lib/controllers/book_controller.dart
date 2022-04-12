import 'package:bookchigo/models/book.dart';
import 'package:get/get.dart';
import 'dart:convert';
import '../constants.dart';
import 'package:http/http.dart' as http;

class BookController extends GetxController {
  static BookController get to => Get.find();

  void searchBook({required String query, int currentPage = 1}) async {
    var response = await http.get(
      Uri.parse(
          'https://dapi.kakao.com/v3/search/book?query=서울&size=30'),
      headers: {
        'Authorization': 'KakaoAK $kKakaoRestApiKey'
      },
    );
    Map<String, dynamic> bookData = jsonDecode(response.body);
    bookData['documents'].forEach((e){
      Book book = Book.fromJson(e);
      print(book.isbn);

    });

  }

  void searchBookDetail({required String isbn})async{
    var response = await http.get(
      Uri.parse(
          'https://dapi.kakao.com/v3/search/book?query=$isbn&target=isbn&size=30'),
      headers: {
        'Authorization': 'KakaoAK $kKakaoRestApiKey'
      },
    );
    Map<String, dynamic> bookData = jsonDecode(response.body);
    print(bookData['documents'].length);
  }
}
