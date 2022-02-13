import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../controllers/user_controller.dart';

class LocationScreenTownSelectArea extends StatelessWidget {
  final int selectedIndex;
  final bool update;
  final List universityList;
  const LocationScreenTownSelectArea({
    Key? key,
    required this.selectedIndex,
    required this.update,
    required this.universityList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: universityList.map((town) {
          return GestureDetector(
            onTap: () async {
              if(update){
                await UserController.to.setUserCityTown(city: kCityList[selectedIndex]['city'], town: town);
                Get.back();
                return;
              }
              Get.back(result: {
                'city':kCityList[selectedIndex]['city'],
                'town':town
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              color: kWhiteColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(town),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
