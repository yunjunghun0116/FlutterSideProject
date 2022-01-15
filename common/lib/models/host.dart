class Host {
  final String userId;
  final String name;
  final String imageUrl;
  final String job;
  final List userTagList;
  Host( {
    required this.userId,
    required this.name,
    required this.imageUrl,
    required this.job,
    required this.userTagList,
  });

  factory Host.fromJson(json) => Host(
    userId: json['userId'],
    name: json['name'],
    imageUrl: json['imageUrl'],
    job:json['job'],
    userTagList: json['userTagList'],
  );

  Map<String, dynamic> toMap() {
    return {
      'userId':userId,
      'name':name,
      'imageUrl':imageUrl,
      'job':job,
      'userTagList':userTagList,
    };
  }
}
