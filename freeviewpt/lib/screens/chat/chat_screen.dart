import 'package:flutter/material.dart';
import '../../controller/designer_controller.dart';
import 'components/chat_screen_subscribe_designer_area.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _currentIndex = 0;

  final DesignerController _designerController = DesignerController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            '채팅',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 10),
            child: const Text(
              '수정',
              style: TextStyle(
                fontSize: 15,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChatScreenSubscribeDesignerArea(),
        ],
      )
    );
  }
}
