import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/controllers/gathering_controller.dart';
import 'package:common/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'components/applicants_screen_select_area.dart';
import 'components/applicants_screen_applicant_card.dart';
import '../../constants.dart';
import '../../models/gathering.dart';
import '../../components/user_gathering_status.dart';

class ApplicantsScreen extends StatefulWidget {
  final Gathering gathering;
  const ApplicantsScreen({
    Key? key,
    required this.gathering,
  }) : super(key: key);

  @override
  State<ApplicantsScreen> createState() => _ApplicantsScreenState();
}

class _ApplicantsScreenState extends State<ApplicantsScreen> {
  int _currentSelectIndex = 0;
  List _applicantsList = [];

  Widget _getApplicantsCard(Gathering gathering) {
    switch (_currentSelectIndex) {
      case 0:
        _applicantsList = gathering.applyList;
        break;
      case 1:
        _applicantsList = gathering.approvalList;
        break;
      default:
        _applicantsList = gathering.cancelList;
        break;
    }

    return ListView(
      children: _applicantsList.map((applicant) {
        return ApplicantsScreenApplicantCard(
          gathering: gathering,
          applicant: applicant,
          followed: false,
          currentIndex: _currentSelectIndex,
          updateFunction: () async {
            if (await UserController.to
                .currentUserUpdate(UserController.to.user!.id)) {
              setState(() {});
            }
          },
          approveFunction: () async => await GatheringController.to
              .userApproveGathering(gathering.id, applicant.userId),
          removeInApprovalFunction: () async => await GatheringController.to
              .removeUserInApprovalList(gathering.id, applicant.userId),
          cancelApproveFunction: () async => await GatheringController.to
              .cancelApproveUser(gathering.id, applicant.userId),
          cancelDeleteFunction: () async => await GatheringController.to
              .cancelDeleteUser(gathering.id, applicant.userId),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kGreyColor,
        elevation: 1,
        centerTitle: false,
        titleSpacing: 0,
        title: const Text(
          '신청자 명단',
          style: TextStyle(
            color: kBlackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: GatheringController.to.getGatheringStream(widget.gathering.id),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            Gathering gathering = Gathering.fromJson({
              'id': snapshot.data!.id,
              ...snapshot.data!.data() as Map<String, dynamic>,
            });
            return Column(
              children: [
                ApplicantsScreenSelectArea(
                  currentIndex: _currentSelectIndex,
                  onPressed: (int index) {
                    setState(() {
                      _currentSelectIndex = index;
                    });
                  },
                ),
                gathering.approvalList.isNotEmpty
                    ? UserGatheringStatus(
                        content:
                            '${gathering.capacity}명 중 ${gathering.approvalList.length}명 모집 완료!!',
                      )
                    : Container(),
                Expanded(
                  child: _getApplicantsCard(gathering),
                ),
              ],
            );
          }
          //TODO 신청자 보여줄것
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
