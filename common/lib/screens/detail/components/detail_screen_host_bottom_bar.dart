import 'package:flutter/material.dart';
import '../../../constants.dart';

class DetailScreenHostBottomBar extends StatelessWidget {
  final Function onPressed;
  final bool over;
  const DetailScreenHostBottomBar({
    Key? key,
    required this.onPressed, required this.over,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(!over){
          onPressed();
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: 40,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
          top: 10,
          left: 10,
          right: 10,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: over?kGreyColor:kRedColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          over?'종료된 모임':'모임취소하기',
          style: TextStyle(
            color: over?kGreyColor:kRedColor,
          ),
        ),
      ),
    );
  }
}
