import 'package:flutter/material.dart';
import '../../constants.dart';
import 'components/title_area.dart';
import 'components/univ_select_area.dart';
import 'components/univ_text_field_area.dart';

class UnivSelectScreen extends StatefulWidget {
  const UnivSelectScreen({Key? key}) : super(key: key);
  @override
  State<UnivSelectScreen> createState() => _UnivSelectScreenState();
}

class _UnivSelectScreenState extends State<UnivSelectScreen> {
  final List _univKeys = kUniversity.keys.toList(); //지역별로
  int _currentSelectedTown = 0;
  int _currentSelectedUniv = 0;
  bool _selectedTown = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleArea(
                  univKeys: _univKeys,
                  currentSelectedTown: _currentSelectedTown,
                  currentSelectedUniv: _currentSelectedUniv,
                  selectedTown: _selectedTown),
              const SizedBox(height: 10),
              UnivSelectArea(selectedTown: _selectedTown, currentSelectedTown: _currentSelectedTown, univKeys: _univKeys, onClickedFunc: (int index){
                setState(() {
                  if (!_selectedTown) {
                    _selectedTown = true;
                  }
                  _currentSelectedTown = index;
                });
              }),
              UnivTextFieldArea(selectedTown: _selectedTown),
              const SizedBox(height: 30),
              ListView.builder(
                shrinkWrap: true,
                itemCount: kUniversity[_univKeys[_currentSelectedTown]].length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentSelectedUniv = index;
                      });
                    },
                    child: Container(
                      color: (_currentSelectedUniv == index && _selectedTown)
                          ? Colors.black12
                          : Colors.white,
                      child: ListTile(
                        leading: Text(
                            kUniversity[_univKeys[_currentSelectedTown]]
                                [index]),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
