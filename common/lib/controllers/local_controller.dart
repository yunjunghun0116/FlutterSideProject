import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalController extends GetxController {
  static LocalController get to => Get.find();
  SharedPreferences? _sharedPreferences;
  final String _idKey = 'id';
  final String _phoneKey = 'phone';
  final String _nameKey = 'name';
  final String _passwordKey = 'password';
  final String _universityKey = 'university';

  @override
  void onInit() async{
    super.onInit();
    await _setSharedPreferences();
  }
  Future<void> _setSharedPreferences()async{
    _sharedPreferences = await SharedPreferences.getInstance();
    update();
  }
  Future<void> clearSharedPreferences()async{
    if(_sharedPreferences == null){
      await _setSharedPreferences();
    }
    await _sharedPreferences!.clear();
  }

  Future<void> setPhone(String phoneNumber) async{
    await _sharedPreferences!.setString(_phoneKey, phoneNumber);
  }

  Future<String?> getPhone()async {
    if(_sharedPreferences == null){
      await _setSharedPreferences();
    }
    return _sharedPreferences!.getString(_phoneKey);
  }

  Future<void> setName(String name)async {
    await _sharedPreferences!.setString(_nameKey, name);
  }

  Future<String?> getName() async{
    if(_sharedPreferences == null){
      await _setSharedPreferences();
    }
    return _sharedPreferences!.getString(_nameKey);
  }

  Future<void> setPassword(String password)async {
    await _sharedPreferences!.setString(_passwordKey, password);
  }

  Future<String?> getPassword() async{
    if(_sharedPreferences == null){
      await _setSharedPreferences();
    }
    return _sharedPreferences!.getString(_passwordKey);
  }

  Future<void> setUniversity(String university) async{
    await _sharedPreferences!.setString(_universityKey, university);
  }

  Future<String?> getUniversity() async{
    if(_sharedPreferences == null){
      await _setSharedPreferences();
    }
    return _sharedPreferences!.getString(_universityKey);
  }

  Future<void> setId(String id) async{
    await _sharedPreferences!.setString(_idKey, id);
  }

  Future<String?> getId() async{
    if(_sharedPreferences == null){
      await _setSharedPreferences();
    }
    return _sharedPreferences!.getString(_idKey);
  }
}
