import 'gathering.dart';

class User {
  final String id;
  final String city;
  final String town;
  final String phoneNumber;
  final String password;
  final String name;
  final String job;
  final  String imageUrl;
  final String kakaoLinkUrl;
  final  List userTagList;//String
  final List applyGatheringList;//Gathering
  final List openGatheringList;//Gathering
  final List likeGathering;//Gathering
  final List likeUser;//User

  User({
    required this.id,required this.city,required this.town,
    required this.phoneNumber,
    required this.password,
    required this.name,

    required this.job,
    required this.imageUrl,
    required this.kakaoLinkUrl,
    required this.userTagList,
    required this.applyGatheringList,
    required this.openGatheringList,
    required this.likeGathering,
    required this.likeUser,
  });

  factory User.fromJson(json) => User(
        id: json['id'],
        phoneNumber: json['phoneNumber'],
        name: json['name'],
        password: json['password'],
        city: json['city'],
        town: json['town'],
        job: json['job'],
        imageUrl: json['imageUrl'],
        kakaoLinkUrl: json['kakaoLinkUrl'],
        userTagList: json['userTagList'],
        applyGatheringList:
            json['applyGatheringList'].map((gathering) {
          return Gathering.fromJson(gathering);
        }).toList(),
        openGatheringList:
            json['openGatheringList'].map((gathering) {
          return Gathering.fromJson(gathering);
        }).toList(),
        likeGathering:
            json['likeGathering'].map((gathering) {
          return Gathering.fromJson(gathering);
        }).toList(),
        likeUser: json['likeUser'].map((user) {
          return User.fromJson(user);
        }).toList(),
      );
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
      'name': name,
      'password':password,
      'city': city,
      'town':town,
      'job': job,
      'imageUrl': imageUrl,
      'userTagList': userTagList,
      'kakaoLinkUrl': kakaoLinkUrl,
      'applyGatheringList': applyGatheringList.map((gathering) {
        return gathering.toMap();
      }).toList(),
      'openGatheringList': openGatheringList.map((gathering) {
        return gathering.toMap();
      }).toList(),
      'likeGathering': likeGathering.map((gathering) {
        return gathering.toMap();
      }).toList(),
      'likeUser': likeUser.map((user) {
        return user.toMap();
      }).toList(),
    };
  }
}
