import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/controllers/user_controller.dart';
import 'package:common/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../utils.dart';

class UserScreenBlockUserPageUserCard extends StatelessWidget {
  final User user;
  const UserScreenBlockUserPageUserCard({Key? key, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(75),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: user.imageUrl,
                  placeholder: (context, url) => Container(
                    width: 50,
                    height: 50,
                    color: kLightGreyColor,
                  ),
                  errorWidget: (context, url, error) => Icon(error),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    user.job,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                await checkDialog(
                  title: '${user.name} 유저를\n 차단 해제 하시겠습니까?',
                  sureText: '차단해제',
                  onPressed: ()async {
                    await UserController.to.blockClearUser(user.id);
                    Get.back();
                  },
                );
              },
              child: const Text(
                '차단 해제',
                style: TextStyle(
                  color: kRedColor,
                ),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
