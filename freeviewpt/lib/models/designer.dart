class Designer {
  //final String designerId;
  final String locationCity;
  final String imageUrl;
  final String designerName;
  final String shopName;
  final String shopAddress;
  final double shopLat;
  final double shopLng;
  final int portfolioCount;
  final int viewCount;
  final int likeCount;
  final List<String> designList;

  Designer({
    required this.locationCity,
    required this.imageUrl,
    required this.designerName,
    required this.shopName,
    required this.shopAddress,
    required this.shopLat,
    required this.shopLng,
    required this.portfolioCount,
    required this.viewCount,
    required this.likeCount,
    required this.designList,
  });

  factory Designer.fromJson(Map<String, dynamic> json) => Designer(
    locationCity: json['locationCity'],
    imageUrl:json['imageUrl'],
    designerName:json['designerName'],
    shopName:json['shopName'],
    shopAddress:json['shopAddress'],
    shopLat:json['shopLat'],
    shopLng:json['shopLng'],
    portfolioCount:json['portfolioCount'],
    viewCount:json['viewCount'],
    likeCount:json['likeCount'],
    designList:json['designList'],
  );
  Map<String, dynamic> toMap() {
    return {
      'locationCity':locationCity,
      'imageUrl':imageUrl,
      'designerName':designerName,
      'shopName':shopName,
      'shopAddress':shopAddress,
      'shopLat':shopLat,
      'shopLng':shopLng,
      'portfolioCount':portfolioCount,
      'viewCount':viewCount,
      'likeCount':likeCount,
      'designList':designList,
    };
  }
}
