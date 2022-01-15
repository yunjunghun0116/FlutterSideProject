class Post {
  //TODO final String id
  final String title;
  final String content;
  final int likeCount;
  final List<Map<String, dynamic>> recommentList;
  final String timeStamp;
  final String authorId;
  final String authorName;
  Post({
    required this.title,
    required this.content,
    required this.likeCount,
    required this.recommentList,
    required this.timeStamp,
    required this.authorId,
    required this.authorName,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        title: json['title'],
        content: json['content'],
        likeCount: json['likeCount'],
        recommentList: json['recommentList'],
        timeStamp: json['timeStamp'],
        authorId: json['authorId'],
        authorName: json['authorName'],
      );
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'likeCont': likeCount,
      'recommentList': recommentList,
      'timeStamp': timeStamp,
      'authorId': authorId,
      'authorName': authorName,
    };
  }
}
