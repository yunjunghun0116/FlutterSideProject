import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/controllers/user_controller.dart';
import 'package:common/models/applicant.dart';
import 'package:common/models/user.dart';
import 'package:get/get.dart';
import '../models/gathering.dart';

class GatheringController extends GetxController {
  static GatheringController get to => Get.find();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Gathering> _gatheringList = [];
  List<Gathering> get gatheringList => _gatheringList;

  List<Gathering> _categoryGatheringList = [];
  List<Gathering> get categoryGatheringList => _categoryGatheringList;

  Future<void> setGatheringList() async {
    QuerySnapshot _gatheringData = await _firestore
        .collection('gathering')
        .where('university',
            isEqualTo: UserController.to.user != null
                ? UserController.to.user!.university
                : '충남대학교')
        .where('over', isEqualTo: false)
        .get();

    List<Gathering> _tempGatheringList = [];
    List _gatheringDocs = _gatheringData.docs;

    for (int i = 0; i < _gatheringDocs.length; i++) {
      Map<String, dynamic> body = {
        'id': _gatheringDocs[i].id,
        ..._gatheringDocs[i].data()
      };
      _tempGatheringList.add(Gathering.fromJson(body));
    }
    _gatheringList = _tempGatheringList;
    update();
  }

  Future<void> setCategoryGatheringList(String category) async {
    _categoryGatheringList = [];
    DateTime nowTime = DateTime.now();
    for (Gathering gathering in _gatheringList) {
      //시간종료되었을때(시작시간이 지났을때)
      if (DateTime.parse(gathering.openTime).difference(nowTime).inSeconds <
          0) {
        updateGathering(gathering.id, {'over': true});
      }
      if (category == '전체보기' || gathering.category == category) {
        _categoryGatheringList.add(gathering);
      }
    }
    update();
  }

  Future<Gathering> getGathering(String id) async {
    DocumentSnapshot<Map<String, dynamic>> _dbGathering =
        await (_firestore.collection('gathering').doc(id).get());

    Map<String, dynamic> json = _dbGathering.data()!;
    Gathering gatheringData = Gathering.fromJson({
      'id': _dbGathering.id,
      ...json,
    });
    return gatheringData;
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
      await setGatheringList();
      return true;
    } catch (e) {
      return false;
    }
  }

  //모임 수정 및 신청/수락/취소 등의 작업을 할때 사용하는 함수
  Future<bool> updateGathering(
      String gatheringId, Map<String, dynamic> body) async {
    try {
      await _firestore.collection('gathering').doc(gatheringId).update(body);
      await GatheringController.to.setGatheringList();
      return true;
    } catch (e) {
      return false;
    }
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
  Future<void> userApproveGathering(
      String gatheringId, String applicantId) async {
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
      _applyGatheringList
          .add({'id': _gatheringData.id, ..._gatheringData.data()!});

      await _firestore
          .collection('user')
          .doc(applicantId)
          .update({'applyGatheringList': _applyGatheringList});
    }
  }

  Future<void> removeUserInApprovalList(
      String gatheringId, String applicantId) async {
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

  Future<void> cancelApproveUser(String gatheringId, String applicantId) async {
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
  }

  Future<void> cancelDeleteUser(String gatheringId, String applicantId) async {
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
