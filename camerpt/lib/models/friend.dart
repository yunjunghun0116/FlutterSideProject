class Friend {
  // final String id
  final String imageUrl;
  final String name;
  final List<String> gameList;
  final Map<String, dynamic> tier; //게임 티어
  final String information;

  Friend({
    required this.imageUrl,
    required this.name,
    required this.gameList,
    required this.tier,
    required this.information,
  });

  factory Friend.fromJson(Map<String, dynamic> json) => Friend(
        imageUrl: json['imageUrl'],
        name: json['name'],
        gameList: json['gameList'],
        tier: json['tier'],
        information: json['information'],
      );
  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'gameList': gameList,
      'tier': tier,
      'information': information,
    };
  }
}
