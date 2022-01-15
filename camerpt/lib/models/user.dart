import 'friend.dart';

class User {
  final String id; //firestore id
  final String email; //login시 사용한 email
  final String imageUrl;
  final String name;
  final List<String> gameList;
  final Map<String, dynamic> tier; //게임 티어
  final String information;
  final List<Friend> friendList; //friend의 id 기록 그리고 그안에 들어가면 더많은것들이
  final List<String> chatList; //chat의 id 기록
  final List<String> receivedFriendList; //Friend의 id 기록

  User({
    required this.id,
    required this.email,
    required this.imageUrl,
    required this.name,
    required this.gameList,
    required this.tier,
    required this.information,
    required this.friendList,
    required this.chatList,
    required this.receivedFriendList,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      email: json['email'],
      imageUrl: json['imageUrl'],
      name: json['name'],
      gameList: json['gameList'],
      tier: json['tier'],
      information: json['information'],
      friendList: json['friendList'],
      chatList: json['chatList'],
      receivedFriendList: json['receivedFriendList']);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'imageUrl': imageUrl,
      'name': name,
      'gameList': gameList,
      'tier': tier,
      'information': information,
      'friendList': friendList.map((Friend friend) => friend.toMap()).toList(),
      'chatList': chatList,
      'receivedFriendList': receivedFriendList,
    };
  }
}
