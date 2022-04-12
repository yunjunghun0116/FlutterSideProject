class Recomment {
  final String comment;
  final String timeStamp;
  final String authorId;
  final String authorName;
  final String authorImageUrl;
  final List reportedList;

  Recomment({
    required this.comment,
    required this.timeStamp,
    required this.authorId,
    required this.authorName,
    required this.authorImageUrl,
    required this.reportedList,
  });

  factory Recomment.fromJson(json) => Recomment(
        comment: json['comment'],
        timeStamp: json['timeStamp'],
        authorId: json['authorId'],
        authorName: json['authorName'],
        authorImageUrl: json['authorImageUrl'] ?? '',
        reportedList: json['reportedList'] ?? [],
      );

  Map<String, dynamic> toMap() {
    return {
      'comment': comment,
      'timeStamp': timeStamp,
      'authorId': authorId,
      'authorName': authorName,
      'authorImageUrl': authorImageUrl,
      'reportedList': reportedList,
    };
  }
}
