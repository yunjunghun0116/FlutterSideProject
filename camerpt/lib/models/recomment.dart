class Recomment {
  final String authorId;
  final String authorName;
  final String title;
  final String timeStamp;

  Recomment({
    required this.authorId,
    required this.authorName,
    required this.title,
    required this.timeStamp,
  });

  factory Recomment.fromJson(Map<String, dynamic> json) => Recomment(
        authorId: json['authorId'],
        authorName: json['authorName'],
        title: json['title'],
        timeStamp: json['timeStamp'],
      );

  Map<String,dynamic> toMap(){
    return {
      'authorId':authorId,
      'authorName':authorName,
      'title':title,
      'timeStamp':timeStamp
    };
  }
}
