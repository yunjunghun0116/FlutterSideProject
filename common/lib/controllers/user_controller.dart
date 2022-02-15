import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/models/user.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  //여기서 유저데이터 관리 - 서버로부터 받은 데이터
  static UserController get to => Get.find();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firestorage = FirebaseStorage.instance;

  User? user;

  //유저데이터 가져오기 - 상세보기에 사용
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

  //유저 정보가 변경되면 업데이트해주기 위해 사용
  Future<String?> updateImage(File file) async {
    String destination = 'images/${user!.id}';
    final ref = _firestorage.ref(destination);
    TaskSnapshot uploadedFile = await ref.putFile(file);
    String? downloadUrl = await uploadedFile.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<bool> updateUser(Map<String, dynamic> body) async {
    try {
      await _firestore.collection('user').doc(user!.id).update(body);
      await currentUserUpdate(user!.id);
      return true;
    } catch (e) {
      return false;
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

  //팔로우 기능 수행하기 위한 함수
  Future<bool> followUser(User follower) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> _userData =
      await _firestore.collection('user').doc(user!.id).get();

      List _likeUserList = _userData['likeUser'];
      _likeUserList.add(follower.toMap());
      await _firestore
          .collection('user')
          .doc(user!.id)
          .update({'likeUser': _likeUserList});
      user!.likeUser.add(follower);
      update();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> unfollowUser(User follower) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> _userData =
      await _firestore.collection('user').doc(user!.id).get();

      List _likeUserList = _userData['likeUser'];
      _likeUserList.removeWhere((user) => user['id'] == follower.id);
      await _firestore
          .collection('user')
          .doc(user!.id)
          .update({'likeUser': _likeUserList});

      user!.likeUser.removeWhere((user) => user.id == follower.id);
      update();
      return true;
    } catch (e) {
      return false;
    }
  }

  //회원가입, 로그인 기능 수행할때 필요한 함수
  Future<String?> signInWithEmailPassword({required String phone, required String password}) async {
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
      UserController.to.user = User.fromJson(_user);
      update();
      return _userData.docs[0].id;
    }
  }

  Future<bool> checkPhoneNumberIsDuplicated(String phoneNumber) async {
    QuerySnapshot _dbPhoneList = await (_firestore
        .collection('user')
        .where('phoneNumber', isEqualTo: phoneNumber)
        .get());
    List _getPhoneList = _dbPhoneList.docs.toList();
    return _getPhoneList.isNotEmpty;
  }

  Future<bool> checkNameIsDuplicated(String name)async{
    QuerySnapshot _dbPhoneList = await (_firestore
        .collection('user')
        .where('name', isEqualTo: name)
        .get());
    List _getPhoneList = _dbPhoneList.docs.toList();
    return _getPhoneList.isNotEmpty;
  }

  /*유저 정보 변경하는 함수*/

  Future<bool> setUserCityTown({required String city,required String town}) async {
    Map<String, dynamic> _body = {
      'city':city,
      'town':town
    };
    if(await updateUser(_body)){
      return await currentUserUpdate(user!.id);
    }
    return false;
  }

  Future<bool> setUserImage(String newImageUrl) async {
    Map<String, dynamic> _body = {
      'imageUrl': newImageUrl,
    };
    return await updateUser(_body);
  }

  Future<bool> setUserName(String newName) async {
    Map<String, dynamic> _body = {'name': newName};
    return await updateUser(_body);
  }

  Future<bool> setUserPassword(String newPassword) async {
    Map<String, dynamic> _body = {'password': newPassword};
    return await updateUser(_body);
  }

  Future<bool> setUserJob(String newJob) async {
    Map<String, dynamic> _body = {'job': newJob};
    return await updateUser(_body);
  }

  Future<bool> setUserTagList(List newTagList) async {
    Map<String, dynamic> _body = {'userTagList': newTagList};
    return await updateUser(_body);
  }

  Future<bool> setUserPhoneNumber(String newPhoneNumber) async {
    Map<String, dynamic> _body = {'phoneNumber': newPhoneNumber};
    return await updateUser(_body);
  }

  Future<bool> setUserKakaoLinkUrl(String newKakaoLinkUrl) async {
    Map<String, dynamic> _body = {'kakaoLinkUrl': newKakaoLinkUrl};
    return await updateUser(_body);
  }
}
