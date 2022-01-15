import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/designer_controller.dart';
import '../../models/designer.dart';
import '../main/main_screen.dart';
import 'components/design_screen_card.dart';

class DesignScreen extends StatefulWidget {
  const DesignScreen({Key? key}) : super(key: key);

  @override
  State<DesignScreen> createState() => _DesignScreenState();
}

class _DesignScreenState extends State<DesignScreen> {
  final DesignerController _designerController = DesignerController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text('디자인', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.home_outlined, color: Colors.black),
            onPressed: () {
              Get.offAll(() => const MainScreen());
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            Column(
              children:
                  _designerController.filteredList.map((Designer designer) {
                return Column(
                  children: designer.designList.map((String imageUrl) {
                    return DesignScreenCard(
                      designer: designer,
                      imageUrl: imageUrl,
                    );
                  }).toList(),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
