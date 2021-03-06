import 'package:common/models/applicant.dart';

import 'host.dart';

class Gathering {
  final String id;
  final Host host;
  final bool over; //이 모임이 터졌나 확인하기위한 bool값 false가 기본값, true가 되면 모임터진거임
  final String title;
  final String category;
  final int capacity;
  final String city;
  final String town;
  final String openTime;
  final String endTime;
  final String location;
  final String locationDetail;
  final String hostMessage;
  final String hostId;
  final List approvalUserIdList;
  final List tagList;
  final List applyList;
  final List approvalList;
  final List cancelList;
  final List reportedList;

  Gathering({
    required this.id,
    required this.host,
    required this.over,
    required this.title,
    required this.category,
    required this.capacity,
    required this.city,
    required this.town,
    required this.openTime,
    required this.endTime,
    required this.location,
    required this.locationDetail,
    required this.hostMessage,
    required this.hostId,
    required this.approvalUserIdList,
    required this.tagList,
    required this.applyList,
    required this.approvalList,
    required this.cancelList,
    required this.reportedList,
  });

  factory Gathering.fromJson(json) => Gathering(
        id: json['id'],
        host: Host.fromJson(json['host']),
        over: json['over'],
        title: json['title'],
        category: json['category'],
        capacity: json['capacity'],
        city: json['city'],
        town: json['town'],
        openTime: json['openTime'],
        endTime: json['endTime'],
        location: json['location'],
        locationDetail: json['locationDetail'],
        hostMessage: json['hostMessage'],
        hostId: json['hostId']??'',
        approvalUserIdList: json['approvalUserIdList']??[],
        tagList: json['tagList']??[],
        applyList: json['applyList'].map((applicant) {
          return Applicant.fromJson(applicant);
        }).toList(),
        approvalList: json['approvalList'].map((applicant) {
          return Applicant.fromJson(applicant);
        }).toList(),
        cancelList: json['cancelList'].map((applicant) {
          return Applicant.fromJson(applicant);
        }).toList(),
        reportedList: json['reportedList']??[],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'host': host.toMap(),
      'over': over,
      'title': title,
      'category': category,
      'capacity': capacity,
      'city': city,
      'town': town,
      'openTime': openTime,
      'endTime': endTime,
      'location': location,
      'locationDetail': locationDetail,
      'hostMessage': hostMessage,
      'hostId':hostId,
      'approvalUserIdList':approvalUserIdList,
      'tagList': tagList,
      'applyList': applyList.map((applicant) {
        return applicant.toMap();
      }).toList(),
      'approvalList': approvalList.map((applicant) {
        return applicant.toMap();
      }).toList(),
      'cancelList': cancelList.map((applicant) {
        return applicant.toMap();
      }).toList(),
      'reportedList': reportedList,
    };
  }
}
