import 'package:flutter/material.dart';
import '../../../constants.dart';

class ApplicantsScreenSelectArea extends StatelessWidget {
  final int currentIndex;
  final Function onPressed;
  const ApplicantsScreenSelectArea({
    Key? key,
    required this.currentIndex,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: kGreyColor),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: (){
                onPressed(0);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                decoration: currentIndex == 0
                    ? const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: kBlackColor),
                        ),
                      )
                    : null,
                child: const Text('승인 대기'),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: (){
                onPressed(1);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                decoration: currentIndex == 1
                    ? const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: kBlackColor),
                        ),
                      )
                    : null,
                child: const Text('승인 완료'),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: (){
                onPressed(2);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                decoration: currentIndex == 2
                    ? const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: kBlackColor),
                        ),
                      )
                    : null,
                child: const Text('취소 요청'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
