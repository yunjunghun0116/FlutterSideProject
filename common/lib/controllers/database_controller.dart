import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/controllers/gathering_controller.dart';
import 'package:common/models/post.dart';
import 'package:common/utils.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import '../models/applicant.dart';
import '../models/gathering.dart';
import '../models/user.dart';

class DatabaseController extends GetxController {
  static DatabaseController get to => Get.find();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firestorage = FirebaseStorage.instance;

  User? user;

  Future<String?> signInWithEmailPassword(String phone, String password) async {
    QuerySnapshot<Map<String, dynamic>> _userData = await _firestore
        .collection('user')
        .where('phoneNumber', isEqualTo: phone)
        .get();
    if (_userData.docs.isEmpty) {
      return null;
    }

    if (_userData.docs.first.data()['password'] == password) {
      Map<String, dynamic> _user = {
        'id': _userData.docs[0].id,
        ..._userData.docs[0].data(),
      };
      user = User.fromJson(_user);
      update();
      return _userData.docs[0].id;
    }
  }

  Future<bool> currentUserUpdate(String id) async {
    DocumentSnapshot<Map<String, dynamic>> _dbUser =
        await (_firestore.collection('user').doc(id).get());
    if (_dbUser.data() == null) {
      return false;
    } else {
      Map<String, dynamic> json = _dbUser.data()!;
      User userData = User.fromJson({
        'id': id,
        ...json,
      });
      user = userData;
      update();
    }
    return true;
  }

  Future<User> getUser(String id) async {
    DocumentSnapshot<Map<String, dynamic>> _dbUser =
        await (_firestore.collection('user').doc(id).get());

    Map<String, dynamic> json = _dbUser.data()!;
    User userData = User.fromJson({
      'id': _dbUser.id,
      ...json,
    });
    return userData;
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

  Future<bool> checkPhoneNumberIsDuplicated(String phoneNumber) async {
    QuerySnapshot _dbPhoneList = await (_firestore
        .collection('user')
        .where('phoneNumber', isEqualTo: phoneNumber)
        .get());
    List _getPhoneList = _dbPhoneList.docs.toList();
    return _getPhoneList.isEmpty;
  }

  /*모임, 유저, 글 등을 데이터베이스에 업로드하는 함수*/

  Future<String> makeUser(Map<String, dynamic> body) async {
    String? id;
    try {
      await _firestore.collection('user').add(body).then((value) {
        id = value.id;
        user = User.fromJson({
          'id': value.id,
          ...body,
        });
        update();
      });
    } catch (e) {
      return '';
    }
    return id!;
  }





  /*Data 불러오는 함수*/

  Future<List<User>?> getUserDocs() async {
    QuerySnapshot _userData = await _firestore.collection('user').get();
    List<User> _userList = [];
    List _userDocs = _userData.docs;
    for (int i = 0; i < _userDocs.length; i++) {
      Map<String, dynamic> body = {
        'id': _userDocs[i].id,
        ..._userDocs[i].data()
      };
      _userList.add(User.fromJson(body));
    }
    return _userList;
  }


  /*User 정보 변경하는 함수*/

  Future<bool> updateUser(Map<String, dynamic> body) async {
    try {
      await _firestore.collection('user').doc(user!.id).update(body);
      await currentUserUpdate(user!.id);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String?> updateImage(File file) async {
    String destination = 'images/${user!.id}';
    final ref = _firestorage.ref(destination);
    TaskSnapshot uploadedFile = await ref.putFile(file);
    String? downloadUrl = await uploadedFile.ref.getDownloadURL();
    return downloadUrl;
  }

  /*Gathering 관리 관련 함수*/



  /*Post 관련 함수*/


}
