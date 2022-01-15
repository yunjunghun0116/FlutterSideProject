import 'package:flutter/material.dart';

class UserButton extends StatelessWidget {
  final String image;
  final String title;
  final Function onClicked;
  const UserButton({
    Key? key, required this.image, required this.title, required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onClicked();
      },
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration:  BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(title),
        ],
      ),
    );
  }
}
