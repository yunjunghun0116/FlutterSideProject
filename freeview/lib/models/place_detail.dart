class PlaceDetail {
  final String placeId;
  final String formattedAddress;
  final String name;
  final double lat;
  final double lng;

  PlaceDetail({
    required this.placeId,
    required this.formattedAddress,
    required this.name,
    required this.lat,
    required this.lng,
  });

  factory PlaceDetail.fromJson(Map<String, dynamic> json) => PlaceDetail(
    placeId: json['place_id'],
    formattedAddress: json['formatted_address']??'',
    name: json['name'],
    lat: json['geometry']['location']['lat'],
    lng: json['geometry']['location']['lng'],
  );

  Map<String,dynamic> toMap(){
    return{
      'placeId': placeId,
      'formattedAddress': formattedAddress,
      'name': name,
      'lat': lat,
      'lng': lng
    };
  }
}
