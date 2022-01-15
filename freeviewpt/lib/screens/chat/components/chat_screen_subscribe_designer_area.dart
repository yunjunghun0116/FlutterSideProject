import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../controller/designer_controller.dart';
import '../../../models/designer.dart';
import 'chat_screen_subscribe_designer_card.dart';

class ChatScreenSubscribeDesignerArea extends StatelessWidget {
  ChatScreenSubscribeDesignerArea({Key? key}) : super(key: key);

  final DesignerController _designerController = DesignerController.to;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: _designerController.designerList.map((Designer designer) {
            return Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(
                      left: 10, top: 10, bottom: 10, right: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: ChatScreenSubscribeDesignerCard(designer: designer),
                      ),
                      kChatButton,
                    ],
                  ),
                ),
                const Divider(),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
