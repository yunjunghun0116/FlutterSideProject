import 'package:flutter/material.dart';
import '../../../controllers/database_controller.dart';
import '../../../constants.dart';
import '../../MainScreen/main_screen.dart';

class TitleArea extends StatelessWidget {
  final bool selectedTown;
  final List univKeys;
  final int currentSelectedTown;
  final int currentSelectedUniv;
  const TitleArea(
      {Key? key,
      required this.selectedTown,
      required this.univKeys,
      required this.currentSelectedTown,
      required this.currentSelectedUniv})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DatabaseController controller = DatabaseController.to;
    return Container(
      width: double.infinity,
      height: 50,
      child: Stack(
        children: [
          Center(
            child: Text(
              '학교 설정',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            right: 10,
            top: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: () async {
                if (selectedTown) {
                  String town = univKeys[currentSelectedTown]; //지역
                  String univ = kUniversity[univKeys[currentSelectedTown]]
                      [currentSelectedUniv]; //대학교
                  await controller.setUserUniv(town, univ);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MainScreen();
                  }));
                }
              },
              child: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFACAAAB),
          ),
        ),
      ),
    );
  }
}
