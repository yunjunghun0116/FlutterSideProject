import 'package:common/controllers/local_controller.dart';
import 'package:get/get.dart';
import 'database_controller.dart';

class UserController extends GetxController {
  //여기서 유저데이터 관리 - 서버로부터 받은 데이터
  static UserController get to => Get.find();

  Future<bool> setUserUniversity(String newUniversity) async {
    Map<String, dynamic> _body = {'university': newUniversity};
    if(await DatabaseController.to.updateUser(_body)){
      LocalController.to.setUniversity(newUniversity);
      return await DatabaseController.to.getCurrentUser(DatabaseController.to.user!.id);
    }
    return false;
  }

  Future<bool> setUserImage(String newImageUrl) async {
    Map<String, dynamic> _body = {
      'imageUrl': newImageUrl,
    };
    return await DatabaseController.to.updateUser(_body);
  }

  Future<bool> setUserName(String newName) async {
    Map<String, dynamic> _body = {'name': newName};
    return await DatabaseController.to.updateUser(_body);
  }

  Future<bool> setUserPassword(String newPassword) async {
    Map<String, dynamic> _body = {'password': newPassword};
    return await DatabaseController.to.updateUser(_body);
  }

  Future<bool> setUserJob(String newJob) async {
    Map<String, dynamic> _body = {'job': newJob};
    return await DatabaseController.to.updateUser(_body);
  }

  Future<bool> setUserTagList(List newTagList) async {
    Map<String, dynamic> _body = {'userTagList': newTagList};
    return await DatabaseController.to.updateUser(_body);
  }

  Future<bool> setUserPhoneNumber(String newPhoneNumber) async {
    Map<String, dynamic> _body = {'phoneNumber': newPhoneNumber};
    return await DatabaseController.to.updateUser(_body);
  }

  Future<bool> setUserInstaId(String newInstaId) async {
    Map<String, dynamic> _body = {'instaId': newInstaId};
    return await DatabaseController.to.updateUser(_body);
  }

  Future<bool> setUserKakaoLinkUrl(String newKakaoLinkUrl) async {
    Map<String, dynamic> _body = {'kakaoLinkUrl': newKakaoLinkUrl};
    return await DatabaseController.to.updateUser(_body);
  }
}
