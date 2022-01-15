import 'package:freeview/models/designer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DesignerController extends GetxController {
  static DesignerController get to => Get.find();
  List<Designer> _designerList = [];

  List<Designer> get designerList => _designerList;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _designerList = [
      Designer(
        locationCity: '대전광역시',
        imageUrl:
            'https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202104/17/6c0f1c1d-6c28-4734-bef3-a4dd11ebe5df.jpg',
        designerName: '라쿤 디자이너',
        shopName: '네일킹',
        shopAddress: '세종시 한솔동 첫마을',
        shopLat: 36.478460,
        shopLng: 127.260958,
        portfolioCount: 100,
        viewCount: 2400,
        likeCount: 30,
        portfolioList: [1, 2, 3],
      ),
      Designer(
        locationCity: '대전광역시',
        imageUrl:
            'https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202104/17/6c0f1c1d-6c28-4734-bef3-a4dd11ebe5df.jpg',
        designerName: '라쿤 실장',
        shopName: '정훈네일',
        shopAddress: '세종시 한솔동 첫마을',
        shopLat: 36.481050,
        shopLng: 127.260407,
        portfolioCount: 100,
        viewCount: 2400,
        likeCount: 50,
        portfolioList: [1, 2, 3, 4, 5, 6],
      ),
      Designer(
        locationCity: '대전광역시',
        imageUrl:
            'https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202104/17/6c0f1c1d-6c28-4734-bef3-a4dd11ebe5df.jpg',
        designerName: '라쿤 엄마',
        shopName: '첫마을네일',
        shopAddress: '세종시 한솔동 첫마을',
        shopLat: 36.480755,
        shopLng: 127.263533,
        portfolioCount: 10,
        viewCount: 2800,
        likeCount: 50,
        portfolioList: [1, 2],
      ),
      Designer(
        locationCity: '대전광역시',
        imageUrl:
            'https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202104/17/6c0f1c1d-6c28-4734-bef3-a4dd11ebe5df.jpg',
        designerName: '라쿤 아빠',
        shopName: '가재네일',
        shopAddress: '세종시 종촌동 가재마을',
        shopLat: 36.504625,
        shopLng: 127.247219,
        portfolioCount: 100,
        viewCount: 2400,
        likeCount: 50,
        portfolioList: [1],
      ),
    ];
    update();
  }

  void getDesignerList() async {}

  List<Designer> filterWithLocation(LatLng currentPosition,
      List<Designer> designerList, double filterKilometer) {
    List<Designer> filteredDesignerList = [];
    for (Designer designer in designerList) {
      if (filterKilometer * 1000 >
          Geolocator.distanceBetween(currentPosition.latitude,
              currentPosition.longitude, designer.shopLat, designer.shopLng)) {
        filteredDesignerList.add(designer);
      }
    }
    return filteredDesignerList;
  }
}
