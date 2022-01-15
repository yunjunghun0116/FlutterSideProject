import 'dart:convert';
import 'package:freeview/constants.dart';
import 'package:freeview/models/place.dart';
import 'package:freeview/models/place_detail.dart';
import 'package:http/http.dart' as http;

class GoogleMapServices {
  final String sessionToken;
  GoogleMapServices({required this.sessionToken});

  Future<List<Place>> getSuggestions(String query) async {
    //https://developers.google.com/maps/documentation/places/web-service/autocomplete?hl=ko 에서 확인
    const String baseUrl =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String type = 'establishment';
    String url =
        '$baseUrl?input=$query&key=$apiKey&type=$type&language=ko&components=country:kr&sessiontoken=$sessionToken';

    final http.Response response = await http.get(Uri.parse(url));
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    final dynamic predictions = responseData['predictions'];

    List<Place> suggestions = [];
    for (var e in predictions) {
      final place = Place.fromJson(e);
      suggestions.add(place);
    }
    return suggestions;
  }

  Future<PlaceDetail> getPlaceDetail(String placeId, String token) async {
    const String baseUrl =
        'https://maps.googleapis.com/maps/api/place/details/json';
    String url =
        '$baseUrl?key=$apiKey&place_id=$placeId&language=ko&sessiontoken=$token';

    final http.Response response = await http.get(Uri.parse(url));
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    final dynamic result = responseData['result'];
    final PlaceDetail placeDetail = PlaceDetail.fromJson(result);

    return placeDetail;
  }
  // //static 이유
  // static Future<String> getAddressFromLocation(double lat, double lng) async {
  //   const String baseUrl = 'https://maps.googleapis.com/maps/api/geocode/json';
  //   String url = '$baseUrl?latlng=$lat,$lng&key=$apiKey&language=ko';
  //
  //   final http.Response response = await http.get(Uri.parse(url));
  //   final Map<String, dynamic> responseData = jsonDecode(response.body);
  //   print('responseData:$responseData');
  //   final formattedAddress = responseData['results'][0]['formatted_address'];
  //   print('formattedAddress : $formattedAddress');
  //
  //   return formattedAddress;
  // }
}
