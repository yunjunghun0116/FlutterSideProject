import 'package:common/models/recomment.dart';

class Comment {
  final String comment;
  final String timeStamp;
  final String authorId;
  final String authorName;
  final String authorImageUrl;
  final List recommentList;

  Comment({
    required this.comment,
    required this.timeStamp,
    required this.authorId,
    required this.authorName,
    required this.authorImageUrl,
    required this.recommentList,
  });

  factory Comment.fromJson(json) => Comment(
        comment: json['comment'],
        timeStamp: json['timeStamp'],
        authorId: json['authorId'],
        authorName: json['authorName'],
        authorImageUrl: json['authorImageUrl']??'',
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
      'authorImageUrl':authorImageUrl,
      'recommentList': recommentList.map((recomment){
        return recomment.toMap();
      }).toList(),
    };
  }
}
