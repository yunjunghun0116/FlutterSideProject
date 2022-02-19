import 'package:common/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'applicants_screen_applicant_card_info.dart';
import '../../profile/profile_screen.dart';
import '../../../models/gathering.dart';
import '../../../models/user.dart';
import '../../../models/applicant.dart';
import '../../../constants.dart';

class ApplicantsScreenApplicantCard extends StatelessWidget {
  final Gathering gathering;
  final Applicant applicant;
  final bool followed;
  final int currentIndex;
  final Function approveFunction;
  final Function removeInApprovalFunction;
  final Function cancelApproveFunction;
  final Function cancelDeleteFunction;
  const ApplicantsScreenApplicantCard({
    Key? key,
    required this.gathering,
    required this.applicant,
    required this.followed,
    required this.currentIndex,
    required this.approveFunction,
    required this.removeInApprovalFunction,
    required this.cancelApproveFunction,
    required this.cancelDeleteFunction,
  }) : super(key: key);

  Widget _getButton() {
    switch (currentIndex) {
      case 0:
        return Expanded(
          child: InkWell(
            onTap: () => approveFunction(),
            child: Container(
              alignment: Alignment.center,
              height: 40,
              decoration: BoxDecoration(
                color: kBlueColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                '승인 완료',
                style: TextStyle(
                  color: kWhiteColor,
                ),
              ),
            ),
          ),
        );
      case 1:
        return Expanded(
          child: InkWell(
            onTap: () => removeInApprovalFunction(),
            child: Container(
              alignment: Alignment.center,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: kRedColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                '승인 취소하기',
                style: TextStyle(
                  color: kRedColor,
                ),
              ),
            ),
          ),
        );
      default:
        return Expanded(
          child: InkWell(
            onTap: () => cancelApproveFunction(),
            child: Container(
              alignment: Alignment.center,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: kRedColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                '취소 요청 승인',
                style: TextStyle(
                  color: kRedColor,
                ),
              ),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ApplicantsScreenApplicantCardInfo(
          imageUrl: applicant.imageUrl,
          name: applicant.name,
          job: applicant.job,
          userTagList: applicant.userTagList,
          followed: followed,
        ),
        Row(
          children: [
            const SizedBox(width: 10),
            _getButton(),
            const SizedBox(width: 10),
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  if (currentIndex == 2) {
                    await cancelDeleteFunction();
                  } else {
                    User user =
                        await UserController.to.getUser(applicant.userId);
                    Get.to(
                      () => ProfileScreen(
                        user: user,
                      ),
                    );
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: kGreyColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    currentIndex == 2 ? '취소 거절하기' : '상세보기',
                    style: const TextStyle(
                      color: kGreyColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(
            color: kGreyColor,
          ),
        ),
      ],
    );
  }
}
