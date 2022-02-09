class Recomment {
  final String comment;
  final String timeStamp;
  final String authorId;
  final String authorName;

  Recomment({
    required this.comment,
    required this.timeStamp,
    required this.authorId,
    required this.authorName,
  });

  factory Recomment.fromJson(json) => Recomment(
    comment: json['comment'],
    timeStamp: json['timeStamp'],
    authorId: json['authorId'],
    authorName: json['authorName'],
  );

  Map<String, dynamic> toMap() {
    return {
      'comment':comment,
      'timeStamp':timeStamp,
      'authorId':authorId,
      'authorName':authorName,
    };
  }
}
