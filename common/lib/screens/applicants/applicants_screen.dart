import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/controllers/gathering_controller.dart';
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
          approveFunction: () async =>
              await GatheringController.to.userApproveGathering(
            gatheringId: gathering.id,
            applicantId: applicant.userId,
          ),
          removeInApprovalFunction: () async =>
              await GatheringController.to.removeUserInApprovalList(
            gatheringId: gathering.id,
            applicantId: applicant.userId,
          ),
          cancelApproveFunction: () async =>
              await GatheringController.to.cancelApproveUser(
            gatheringId: gathering.id,
            applicantId: applicant.userId,
          ),
          cancelDeleteFunction: () async =>
              await GatheringController.to.cancelDeleteUser(
            gatheringId: gathering.id,
            applicantId: applicant.userId,
          ),
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
          '????????? ??????',
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
                            '${gathering.capacity}??? ??? ${gathering.approvalList.length}??? ?????? ??????!!',
                      )
                    : Container(),
                Expanded(
                  child: _getApplicantsCard(gathering),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
