import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/designer.dart';

class ArtistScreenBottomBar extends StatelessWidget {
  final Designer designer;
  const ArtistScreenBottomBar({Key? key, required this.designer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.black),
              bottom: BorderSide(color: Colors.black),
            )
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 50,
              height: 50,
              child: Icon(Icons.call_outlined),
            ),
            Expanded(
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: kOrangeColor,
                    border: Border(
                      left: BorderSide(color: Colors.black),
                    )),
                child: const Text(
                  '대화하기',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
