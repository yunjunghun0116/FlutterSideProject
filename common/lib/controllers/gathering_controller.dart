import 'package:get/get.dart';
import '../controllers/database_controller.dart';
import '../models/gathering.dart';

class GatheringController extends GetxController {
  static GatheringController get to => Get.find();

  List<Gathering> _gatheringList = [];
  List<Gathering> get gatheringList => _gatheringList;

  List<Gathering> _categoryGatheringList = [];
  List<Gathering> get categoryGatheringList => _categoryGatheringList;

  Future<void> setGatheringList() async {
    _gatheringList = (await DatabaseController.to.getGatheringDocs()) ?? [];
    update();
  }

  Future<void> setCategoryGatheringList(String category) async {
    _categoryGatheringList = [];
    DateTime nowTime = DateTime.now();
    for (Gathering gathering in _gatheringList) {
      //시간종료되었을때(시작시간이 지났을때)
      if (DateTime.parse(gathering.openTime).difference(nowTime).inSeconds <
          0) {
        DatabaseController.to.updateGathering(gathering.id, {'over': true});
      }
      if (category == '전체보기' || gathering.category == category) {
        _categoryGatheringList.add(gathering);
      }
    }
    update();
  }
}
