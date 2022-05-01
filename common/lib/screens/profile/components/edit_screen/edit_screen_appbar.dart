import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants.dart';

class EditScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function onPressed;
  final String title;
  const EditScreenAppBar({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: kWhiteColor,
      foregroundColor: kGreyColor,
      centerTitle: false,
      titleSpacing: 0,
      elevation: 1,
      leading: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          Get.back(result: false);
        },
        child: const Icon(Icons.arrow_back_ios),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: kBlackColor,
        ),
      ),
      actions: [
        InkWell(
          onTap: () => onPressed(),
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: const Text(
              '변경',
              style: TextStyle(
                fontSize: 16,
                color: kMainColor,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ],
    );
  }
}
