import 'package:flutter/material.dart';
import 'profile_screen_edit_button.dart';
import 'profile_screen_follow_button.dart';
import 'profile_screen_followed_button.dart';
import '../../../constants.dart';

class ProfileScreenButtonArea extends StatelessWidget {
  final Function followedPressed;
  final Function followPressed;
  final Function editPressed;
  final bool userIsMe;
  final bool isFollowed;
  const ProfileScreenButtonArea({
    Key? key,
    required this.userIsMe,
    required this.followPressed,
    required this.followedPressed,
    required this.editPressed,
    required this.isFollowed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(
                color: kGreyColor,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.asset(
              'assets/images/instagram_logo.png',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: userIsMe
                ? ProfileScreenEditButton(
                    onPressed: editPressed,
                  )
                : isFollowed
                    ? ProfileScreenFollowedButton(
                        onPressed: followedPressed,
                      )
                    : ProfileScreenFollowButton(
                        onPressed: followPressed,
                      ),
          ),
        ],
      ),
    );
  }
}
