import 'package:common/models/recomment.dart';

class Comment {
  final String comment;
  final String timeStamp;
  final String authorId;
  final String authorName;
  final List<Recomment> recommentList;

  Comment({
    required this.comment,
    required this.timeStamp,
    required this.authorId,
    required this.authorName,
    required this.recommentList,
  });

  factory Comment.fromJson(json) => Comment(
        comment: json['comment'],
        timeStamp: json['timeStamp'],
        authorId: json['authorId'],
        authorName: json['authorName'],
        recommentList: json['recommentList'].map((recomment) {
          return Recomment.fromJson(recomment);
        }).toList(),
      );

  Map<String, dynamic> toMap() {
    return {
      'comment': comment,
      'timeStamp': timeStamp,
      'authorId': authorId,
      'authorName': authorName,
      'recommentList': recommentList.map((recomment){
        return recomment.toMap();
      }).toList(),
    };
  }
}
