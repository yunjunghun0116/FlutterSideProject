import 'package:flutter/material.dart';
import '../../../constants.dart';

class OrderSelectArea extends StatelessWidget {
  final Size size;
  final int selectedOrderIndex;
  final Function changeOrder;
  const OrderSelectArea({
    Key? key,
    required this.size,
    required this.selectedOrderIndex, required this.changeOrder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        OrderCard(
          size: size,
          selectedOrderIndex: selectedOrderIndex,
          currentIndex: 0,
          title: '기본순', changeOrder: changeOrder,
        ),
        OrderCard(
          size: size,
          selectedOrderIndex: selectedOrderIndex,
          currentIndex: 1,
          title: '별점순', changeOrder: changeOrder,
        ),
        OrderCard(
          size: size,
          selectedOrderIndex: selectedOrderIndex,
          currentIndex: 2,
          title: '가격높은순', changeOrder: changeOrder,
        ),
        OrderCard(
          size: size,
          selectedOrderIndex: selectedOrderIndex,
          currentIndex: 3,
          title: '가격낮은순', changeOrder: changeOrder,
        ),
      ],
    );
  }
}

class OrderCard extends StatelessWidget {
  final Size size;
  final int selectedOrderIndex;
  final int currentIndex;
  final String title;
  final Function changeOrder;
  const OrderCard({
    Key? key,
    required this.selectedOrderIndex,
    required this.currentIndex,
    required this.title,
    required this.size, required this.changeOrder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        changeOrder(currentIndex);
      },
      child: Container(
        alignment: Alignment.center,
        width: size.width * 0.2,
        height: 30,
        decoration: BoxDecoration(
          color: selectedOrderIndex == currentIndex ? kBackgroundColor : null,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          title,
          style: TextStyle(
              color: selectedOrderIndex == currentIndex
                  ? kOrderTextColor
                  : kTextfieldBackgroundColor),
        ),
      ),
    );
  }
}
