import 'package:flutter/material.dart';
import 'package:freeview/constants.dart';
import 'package:freeview/screens/HomeScreen/components/custom_dropdown_button.dart';

class HomeScreenBottomNavigationBar extends StatefulWidget {
  const HomeScreenBottomNavigationBar({Key? key}) : super(key: key);
  @override
  State<HomeScreenBottomNavigationBar> createState() =>
      _HomeScreenBottomNavigationBarState();
}

class _HomeScreenBottomNavigationBarState
    extends State<HomeScreenBottomNavigationBar> {

  int? likeValue;
  int? distanceValue;
  int? priceValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
        top: BorderSide(color: Colors.black),
      )),
      height: 60,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CustomDropdownButton(
              hintText: '추천순',
              buttonValue: likeValue,
              onChangedFunction: (int? value){
                setState(() {
                  likeValue = value;
                });
              },
              itemList: kLikeList,

            ),
            CustomDropdownButton(
              hintText: '거리순',
              buttonValue: distanceValue,
              onChangedFunction: (int? value){
                setState(() {
                  distanceValue = value;
                });
              },
              itemList: kDistanceList,
            ),CustomDropdownButton(
              hintText: '가격순',
              buttonValue: priceValue,
              onChangedFunction: (int? value){
                setState(() {
                  priceValue = value;
                });
              },
              itemList: kPriceList ,
            )
          ],
        ),
      ),
    );
  }
}
