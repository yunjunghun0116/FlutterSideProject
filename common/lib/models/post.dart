import 'package:common/models/comment.dart';

class Post {
  final String id;
  final String category;
  final String university;
  final String title;
  final String content;
  final String timeStamp;
  final String authorId;
  final String authorName;
  final List commentList;

  Post({
    required this.id,
    required this.category,
    required this.university,
    required this.title,
    required this.content,
    required this.timeStamp,
    required this.authorId,
    required this.authorName,
    required this.commentList,
  });

  factory Post.fromJson(json) => Post(
    id: json['id'],
    category: json['category'],
    university: json['university'],
    title: json['title'],
    content: json['content'],
    timeStamp: json['timeStamp'],
    authorId: json['authorId'],
    authorName: json['authorName'],
    commentList: json['commentList'].map((comment) {
      return Comment.fromJson(comment);
    }).toList(),
  );

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'category':category,
      'university':university,
      'title':title,
      'content':content,
      'timeStamp':timeStamp,
      'authorId':authorId,
      'authorName':authorName,
      'commentList':commentList.map((comment){
        return comment.toMap();
      }).toList(),
    };
  }
}
