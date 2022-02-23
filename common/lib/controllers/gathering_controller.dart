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

  //3.모임의 디테일
  Stream<DocumentSnapshot> getGatheringStream(String gatheringId) {
    return _firestore.collection('gathering').doc(gatheringId).snapshots();
  }

  Future<bool> makeGathering(Map<String, dynamic> body) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> _userData = await _firestore
          .collection('user')
          .doc(UserController.to.user!.id)
          .get();
      List _openGatheringList = _userData['openGatheringList'];

      await (_firestore.collection('gathering').add(body)).then((value) {
        Map<String, dynamic> updateBody = {
          'id': value.id,
          ...body,
        };
        _openGatheringList.add(updateBody);
      });

      await _firestore
          .collection('user')
          .doc(UserController.to.user!.id)
          .update({
        'openGatheringList': _openGatheringList,
      });
      await UserController.to.currentUserUpdate(UserController.to.user!.id);
      return true;
    } catch (e) {
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

      DocumentSnapshot<Map<String, dynamic>> _userData = await _firestore
          .collection('user')
          .doc(UserController.to.user!.id)
          .get();
      List _openGatheringList = _userData['openGatheringList'];

      int index = _openGatheringList
          .indexWhere((element) => element['id'] == gatheringId);
      _openGatheringList[index] = {
        'id': gatheringId,
        ...body,
      };

      await _firestore
          .collection('user')
          .doc(UserController.to.user!.id)
          .update({
        'openGatheringList': _openGatheringList,
      });
      await UserController.to.currentUserUpdate(UserController.to.user!.id);
      return true;
    } catch (e) {
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

    _applyList.add(Applicant(
      userId: UserController.to.user!.id,
      name: UserController.to.user!.name,
      imageUrl: UserController.to.user!.imageUrl,
      job: UserController.to.user!.job,
      userTagList: UserController.to.user!.userTagList,
    ).toMap());

    await _firestore
        .collection('gathering')
        .doc(gatheringId)
        .update({'applyList': _applyList});

    DocumentSnapshot<Map<String, dynamic>> _dbUser = await _firestore
        .collection('user')
        .doc(UserController.to.user!.id)
        .get();

    List _applyGatheringList = _dbUser['applyGatheringList'];

    _applyGatheringList.add({'id': gatheringId, ...?_gatheringData.data()});

    await _firestore.collection('user').doc(UserController.to.user!.id).update({
      'applyGatheringList': _applyGatheringList,
    });
    return;
  }

  Future<void> userCancelGathering(String gatheringId) async {
    DocumentSnapshot<Map<String, dynamic>> _gatheringData =
        await _firestore.collection('gathering').doc(gatheringId).get();
    List _cancelList = _gatheringData['cancelList'];
    _cancelList.add(Applicant(
      userId: UserController.to.user!.id,
      name: UserController.to.user!.name,
      imageUrl: UserController.to.user!.imageUrl,
      job: UserController.to.user!.job,
      userTagList: UserController.to.user!.userTagList,
    ).toMap());
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

      await _firestore.collection('gathering').doc(gatheringId).update({
        'approvalList': _approvalList,
        'applyList': _applyList,
      });
      DocumentSnapshot<Map<String, dynamic>> _applicantData =
          await _firestore.collection('user').doc(applicantId).get();
      List _applyGatheringList = _applicantData['applyGatheringList'];
      if (_applyGatheringList
              .indexWhere((element) => element['id'] == gatheringId) !=
          -1) {
        return;
      }
      _applyGatheringList
          .add({'id': _gatheringData.id, ..._gatheringData.data()!});

      await _firestore
          .collection('user')
          .doc(applicantId)
          .update({'applyGatheringList': _applyGatheringList});
    }
  }

  Future<void> removeUserInApprovalList({
    required String gatheringId,
    required String applicantId,
  }) async {
    DocumentSnapshot<Map<String, dynamic>> _gatheringData =
        await _firestore.collection('gathering').doc(gatheringId).get();
    List _approvalList = _gatheringData['approvalList'];
    _approvalList
        .removeWhere((applicant) => applicant['userId'] == applicantId);

    await _firestore.collection('gathering').doc(gatheringId).update({
      'approvalList': _approvalList,
    });

    DocumentSnapshot<Map<String, dynamic>> _applicantData =
        await _firestore.collection('user').doc(applicantId).get();
    List _applyGatheringList = _applicantData['applyGatheringList'];
    _applyGatheringList
        .removeWhere((gathering) => gathering['id'] == gatheringId);
    await _firestore
        .collection('user')
        .doc(applicantId)
        .update({'applyGatheringList': _applyGatheringList});
  }

  Future<void> cancelApproveUser({
    required String gatheringId,
    required String applicantId,
  }) async {
    DocumentSnapshot<Map<String, dynamic>> _gatheringData =
        await _firestore.collection('gathering').doc(gatheringId).get();
    List _approvalList = _gatheringData['approvalList'];
    List _cancelList = _gatheringData['cancelList'];
    _approvalList
        .removeWhere((applicant) => applicant['userId'] == applicantId);
    _cancelList.removeWhere((applicant) => applicant['userId'] == applicantId);

    await _firestore.collection('gathering').doc(gatheringId).update({
      'approvalList': _approvalList,
      'cancelList': _cancelList,
    });

    DocumentSnapshot<Map<String, dynamic>> _applicantData =
        await _firestore.collection('user').doc(applicantId).get();
    List _applyGatheringList = _applicantData['applyGatheringList'];
    _applyGatheringList
        .removeWhere((gathering) => gathering['id'] == gatheringId);
    await _firestore
        .collection('user')
        .doc(applicantId)
        .update({'applyGatheringList': _applyGatheringList});
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
