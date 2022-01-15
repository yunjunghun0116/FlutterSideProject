import 'package:flutter/material.dart';

import '../constants.dart';

class ScreenTitle extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const ScreenTitle({Key? key, required this.title,}) : super(key: key);

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: kWhiteColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: kTitleTextStyle,
        ),
      ),
    );
  }


}
