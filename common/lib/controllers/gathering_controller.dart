import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/controllers/user_controller.dart';
import 'package:common/models/applicant.dart';
import 'package:get/get.dart';

class GatheringController extends GetxController {
  static GatheringController get to => Get.find();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //데이터를 불러오는 과정
  //1. 모든 모임들
  Stream<QuerySnapshot> getGatheringListStream() {
    return _firestore
        .collection('gathering')
        .where('city',
            isEqualTo: UserController.to.user != null
                ? UserController.to.user!.city
                : '서울특별시')
        .where('over', isEqualTo: false)
        .snapshots();
  }

  //2. 해당 카테고리에 해당하는 모임들
  Stream<QuerySnapshot> getCategoryGatheringListStream(String category) {
    return _firestore
        .collection('gathering')
        .where('city',
            isEqualTo: UserController.to.user != null
                ? UserController.to.user!.city
                : '서울특별시')
        .where('over', isEqualTo: false)
        .where('category', isEqualTo: category)
        .snapshots();
  }

  Stream<QuerySnapshot> getOpenGatheringListStream(String userId) {
    return _firestore
        .collection('gathering')
        .where('hostId', isEqualTo: userId)
        .snapshots();
  }

  Stream<QuerySnapshot> getParticipateGatheringListStream(String userId) {
    return _firestore
        .collection('gathering')
        .where('approvalUserIdList', arrayContains: userId)
        .snapshots();
  }

  Stream<QuerySnapshot> getSearchKeywordGatheringListStream(String searchTerm) {
    return _firestore
        .collection('gathering')
        .where('tagList', arrayContains: searchTerm)
        .snapshots();
  }

  Stream<QuerySnapshot> getSearchTitleGatheringListStream(String searchTerm) {
    return _firestore
        .collection('gathering')
        .where('title', isGreaterThanOrEqualTo: searchTerm)
        .where('title', isLessThanOrEqualTo: searchTerm)
        .snapshots();
  }

  //3.모임의 디테일
  Stream<DocumentSnapshot> getGatheringStream(String gatheringId) {
    return _firestore.collection('gathering').doc(gatheringId).snapshots();
  }

  Future<bool> makeGathering(Map<String, dynamic> body) async {
    try {
      await (_firestore.collection('gathering').add(body));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  //모임 수정 및 신청/수락/취소 등의 작업을 할때 사용하는 함수
  Future<bool> updateGathering({
    required String gatheringId,
    required Map<String, dynamic> body,
  }) async {
    try {
      await _firestore.collection('gathering').doc(gatheringId).update(body);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> expiredGathering({
    required String gatheringId,
    required String hostId,
  }) async {
    try {
      await _firestore.collection('gathering').doc(gatheringId).update({
        'over': true,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> reportGathering(
      {required String gatheringId, required String userId}) async {
    DocumentSnapshot<Map<String, dynamic>> _gatheringData =
        await _firestore.collection('gathering').doc(gatheringId).get();
    List _reportedList = _gatheringData['reportedList'];
    if (!_reportedList.contains(userId)) {
      _reportedList.add(userId);
    }
    await _firestore
        .collection('gathering')
        .doc(gatheringId)
        .update({'reportedList': _reportedList});
  }

  //이용자 입장에서 필요 함수
  Future<void> userApplyGathering(String gatheringId) async {
    DocumentSnapshot<Map<String, dynamic>> _gatheringData =
        await _firestore.collection('gathering').doc(gatheringId).get();

    List _applyList = _gatheringData['applyList'];

    _applyList.add(
      Applicant(
        userId: UserController.to.user!.id,
        name: UserController.to.user!.name,
        imageUrl: UserController.to.user!.imageUrl,
        job: UserController.to.user!.job,
        userTagList: UserController.to.user!.userTagList,
      ).toMap(),
    );

    await _firestore
        .collection('gathering')
        .doc(gatheringId)
        .update({'applyList': _applyList});
    return;
  }

  Future<void> userCancelGathering(String gatheringId) async {
    DocumentSnapshot<Map<String, dynamic>> _gatheringData =
        await _firestore.collection('gathering').doc(gatheringId).get();
    List _cancelList = _gatheringData['cancelList'];
    _cancelList.add(
      Applicant(
        userId: UserController.to.user!.id,
        name: UserController.to.user!.name,
        imageUrl: UserController.to.user!.imageUrl,
        job: UserController.to.user!.job,
        userTagList: UserController.to.user!.userTagList,
      ).toMap(),
    );
    await _firestore
        .collection('gathering')
        .doc(gatheringId)
        .update({'cancelList': _cancelList});
  }

  //주최자 입장에서 필요 함수
  Future<void> userApproveGathering({
    required String gatheringId,
    required String applicantId,
  }) async {
    DocumentSnapshot<Map<String, dynamic>> _gatheringData =
        await _firestore.collection('gathering').doc(gatheringId).get();
    List _applyList = _gatheringData['applyList'];
    int _index = _applyList
        .indexWhere((applicant) => applicant['userId'] == applicantId);

    if (_index > -1) {
      List _approvalList = _gatheringData['approvalList'];
      _approvalList.add(_applyList[_index]);
      _applyList.removeAt(_index);

      List _approvalUserIdList = _gatheringData['approvalUserIdList'];
      if (!_approvalUserIdList.contains(applicantId)) {
        _approvalUserIdList.add(applicantId);
      }

      await _firestore.collection('gathering').doc(gatheringId).update({
        'approvalList': _approvalList,
        'applyList': _applyList,
        'approvalUserIdList': _approvalUserIdList,
      });
    }
  }

  Future<void> removeUserInApprovalList({
    required String gatheringId,
    required String applicantId,
  }) async {
    DocumentSnapshot<Map<String, dynamic>> _gatheringData =
        await _firestore.collection('gathering').doc(gatheringId).get();
    List _approvalList = _gatheringData['approvalList'];
    List _approvalUserIdList = _gatheringData['approvalUserIdList'];
    _approvalList
        .removeWhere((applicant) => applicant['userId'] == applicantId);
    _approvalUserIdList.remove(applicantId);
    await _firestore.collection('gathering').doc(gatheringId).update({
      'approvalList': _approvalList,
      'approvalUserIdList': _approvalUserIdList,
    });
  }

  Future<void> cancelApproveUser({
    required String gatheringId,
    required String applicantId,
  }) async {
    DocumentSnapshot<Map<String, dynamic>> _gatheringData =
        await _firestore.collection('gathering').doc(gatheringId).get();
    List _approvalList = _gatheringData['approvalList'];
    List _cancelList = _gatheringData['cancelList'];
    List _approvalUserIdList = _gatheringData['approvalUserIdList'];
    _approvalList
        .removeWhere((applicant) => applicant['userId'] == applicantId);
    _cancelList.removeWhere((applicant) => applicant['userId'] == applicantId);
    _approvalUserIdList.removeWhere((userId) => userId == applicantId);

    await _firestore.collection('gathering').doc(gatheringId).update({
      'approvalList': _approvalList,
      'cancelList': _cancelList,
      'approvalUserIdList': _approvalUserIdList,
    });
  }

  Future<void> cancelDeleteUser({
    required String gatheringId,
    required String applicantId,
  }) async {
    DocumentSnapshot<Map<String, dynamic>> _gatheringData =
        await _firestore.collection('gathering').doc(gatheringId).get();
    List _cancelList = _gatheringData['cancelList'];
    _cancelList.removeWhere((applicant) => applicant['userId'] == applicantId);

    await _firestore
        .collection('gathering')
        .doc(gatheringId)
        .update({'cancelList': _cancelList});
  }
}
