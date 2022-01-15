import 'package:flutter/material.dart';

class Select2 extends StatelessWidget {
  final Function nextFunction;
  const Select2({Key? key, required this.nextFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Text('select2'),
          ElevatedButton(
            onPressed: () {
              nextFunction();
            },
            child: const Text('다음으로'),
          ),
        ],
      ),
    );
  }
}
