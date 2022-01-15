import 'package:get/get.dart';

class FilterDesignerController extends GetxController {
  //이곳에서 필터링을 하기위한 필터링정보들을 관리 -> 이후에 DesignerController에 대해 update를 진행해주면됨
  static FilterDesignerController get to => Get.find();

  String filteredRecommend = '추천순';
  String filteredShopCategory = '샵 정보';

  List<String> kRecommendCategoryList = [
    '추천순','가까운 순','조회수 순','찜 많이한순','포트폴리오 많은순'
  ];
  List<String> kShopCategoryList = [
    '주차 가능','1인샵','당일 예약','지하철역','동물 동반','심야 영업'
  ];

  String getRecommendCategory(int index) => kRecommendCategoryList[index];

  void updateRecommendFilter(int index){
    filteredRecommend = kRecommendCategoryList[index];
    update();
  }
  void updateShopCategoryFilter(int index){
    filteredShopCategory = kShopCategoryList[index];
    update();
  }
  void resetFilter(){
    filteredRecommend = '추천순';
    filteredShopCategory = '샵 정보';
    update();
  }

}
