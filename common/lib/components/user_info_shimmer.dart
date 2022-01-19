import 'package:common/constants.dart';
import 'package:flutter/material.dart';


class UserInfoShimmer extends StatelessWidget {
  const UserInfoShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kShimmerColor,
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                    top: 10, bottom: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:kShimmerColor,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kShimmerColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(10),
                height: 40,
                decoration: BoxDecoration(
                  color:kShimmerColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(10),
                height: 40,
                decoration: BoxDecoration(
                  color: kShimmerColor,
                  borderRadius: BorderRadius.circular(10),
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
