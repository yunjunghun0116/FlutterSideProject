import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(DateTime.now().difference(DateTime.parse('2022-01-02 17:35')));
    print(DateTime.parse('2022-01-02 17:35'));
    String dateTime = DateTime.now().difference(DateTime.parse('2022-01-02 17:35')).inMinutes.toString();
    print(DateTime.parse('2022-01-02 17:35').toString().substring(0,16));
    print(DateTime.parse('2022-01-02 17:35').toString().substring(0,10));
    print(dateTime);
    return Column(
      children: [
        Text('채팅스크린'),
      ],
    );
  }
}
