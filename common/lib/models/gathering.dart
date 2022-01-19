import 'package:common/models/applicant.dart';

import 'host.dart';

class Gathering {
  final String id;
  final Host host;
  final bool over; //이 모임이 터졌나 확인하기위한 bool값 false가 기본값, true가 되면 모임터진거임
  final String title;
  final String category;
  final int capacity;
  final String openTime;
  final String endTime;
  final String location;
  final String locationDetail;
  final String hostMessage;
  final List tagList;
  final List previousImageList;
  List applyList;
  List approvalList;
  List cancelList;

  Gathering({
    required this.id,
    required this.host,
    required this.over,
    required this.title,
    required this.category,
    required this.capacity,
    required this.openTime,
    required this.endTime,
    required this.location,
    required this.locationDetail,
    required this.hostMessage,
    required this.tagList,
    required this.previousImageList,
    required this.applyList,
    required this.approvalList,
    required this.cancelList,
  });

  factory Gathering.fromJson(json) => Gathering(
        id: json['id'],
        host: Host.fromJson(json['host']),
        over: json['over'],
        title: json['title'],
        category: json['category'],
        capacity: json['capacity'],
        openTime: json['openTime'],
        endTime: json['endTime'],
        location: json['location'],
        locationDetail: json['locationDetail'],
        hostMessage: json['hostMessage'],
        tagList: json['tagList'],
        previousImageList: json['previousImageList'],
        applyList: json['applyList'].map((applicant) {
          return Applicant.fromJson(applicant);
        }).toList(),
        approvalList:
            json['approvalList'].map((applicant) {
          return Applicant.fromJson(applicant);
        }).toList(),
        cancelList: json['cancelList'].map((applicant) {
          return Applicant.fromJson(applicant);
        }).toList(),
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'host': host.toMap(),
      'over': over,
      'title': title,
      'category': category,
      'capacity': capacity,
      'openTime': openTime,
      'endTime': endTime,
      'location': location,
      'locationDetail': locationDetail,
      'hostMessage': hostMessage,
      'tagList': tagList,
      'previousImageList': previousImageList,
      'applyList':applyList.map((applicant){
        return applicant.toMap();
      }).toList(),
      'approvalList':approvalList.map((applicant){
        return applicant.toMap();
      }).toList(),
      'cancelList':cancelList.map((applicant){
        return applicant.toMap();
      }).toList(),
    };
  }
}
