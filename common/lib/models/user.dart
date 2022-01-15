import 'gathering.dart';

class User {
  final String id;
  final String university;
  String phoneNumber;
  String name;
  String job;
  String imageUrl;
  String instaId;
  String kakaoLinkUrl;
  List userTagList;//String
  final List applyGatheringList;//Gathering
  final List openGatheringList;//Gathering
  final List likeGathering;//Gathering
  final List likeUser;//User

  User({
    required this.id,
    required this.phoneNumber,
    required this.name,
    required this.university,
    required this.job,
    required this.imageUrl,
    required this.instaId,
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
        university: json['university'],
        job: json['job'],
        imageUrl: json['imageUrl'],
        instaId: json['instaId'],
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
      'university': university,
      'job': job,
      'imageUrl': imageUrl,
      'userTagList': userTagList,
      'instaId': instaId,
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

  void setUserName(String newName) {
    name = newName;
  }

  void setUserPhoneNumber(String newPhoneNumber) {
    phoneNumber = newPhoneNumber;
  }

  void setUserImageUrl(String newImageUrl) {
    imageUrl = newImageUrl;
  }

  void setUserJob(String newJob) {
    job = newJob;
  }

  void setUserTagList(List<String> newTagList) {
    userTagList = newTagList;
  }

  void setUserInstaId(String newId) {
    instaId = newId;
  }

  void setUserKakaoLinkUrl(String newKakaoLinkUrl) {
    kakaoLinkUrl = newKakaoLinkUrl;
  }
}
