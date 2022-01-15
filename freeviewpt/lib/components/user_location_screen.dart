import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserLocationScreen extends StatefulWidget {
  const UserLocationScreen({Key? key}) : super(key: key);
  @override
  State<UserLocationScreen> createState() => _UserLocationScreenState();
}

class _UserLocationScreenState extends State<UserLocationScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black26),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('지역설정', style: TextStyle(color: Colors.black)),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/map_image.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 200,
              left: -10,
              right: 0,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purple,
                    ),
                    child: const Text(
                      '지도를 움직여서 위치를 설정하세요',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.location_on_outlined,
                      size: 50,
                      color: Colors.pink,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: size.width,
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(left: 20, top: 20, bottom: 10),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      color: Colors.grey,
                      child: const Text(
                        '주소',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, bottom: 10),
                      child: const Text(
                        '대전 엑스포 시민광장',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Container(
                        width: size.width,
                        padding: const EdgeInsets.only(top: 20, bottom: 30),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.yellow),
                        child: const Center(
                            child: Text(
                          '해당 위치로 설정',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
