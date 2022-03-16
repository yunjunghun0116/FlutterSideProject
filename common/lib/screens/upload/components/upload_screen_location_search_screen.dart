import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../utils.dart';

class UploadScreenLocationSearchScreen extends StatefulWidget {
  const UploadScreenLocationSearchScreen({Key? key}) : super(key: key);

  @override
  _UploadScreenLocationSearchScreenState createState() =>
      _UploadScreenLocationSearchScreenState();
}

class _UploadScreenLocationSearchScreenState
    extends State<UploadScreenLocationSearchScreen> {
  final TextEditingController _addressController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<Widget> _resultCard = [];

  Future<void> getPlaceList(String text) async {
    List _result = await getDataWithKakaoApi(text);
    List<Widget> _listTileList = [];
    for (int i = 0; i < _result.length; i++) {
      _listTileList.add(
        GestureDetector(
          onTap: () {
            Get.back(result: {
              'address': _result[i]['address_name'],
              'place': _result[i]['place_name'],
            });
          },
          child: ListTile(
            title: Text(_result[i]['place_name']),
            subtitle: Text(_result[i]['address_name']),
          ),
        ),
      );
    }
    setState(() {
      _resultCard = _listTileList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kGreyColor,
        automaticallyImplyLeading: false,
        centerTitle: false,
        titleSpacing: 0,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back(result: null);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          '주소 검색',
          style: TextStyle(
            color: kBlackColor,
          ),
        ),
      ),
      body: Column(
        children: [
          TextField(
            focusNode: _focusNode,
            controller: _addressController,
            onSubmitted: (String s) {
              getPlaceList(s);
            },
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kBlackColor,
                  width: 1.5,
                ),
              ),
              focusColor: kGreyColor,
              filled: true,
              hintStyle: const TextStyle(color: kGreyColor),
              hintText: "지번, 도로명, 건물명으로 검색",
              fillColor: kWhiteColor,
              suffixIcon: GestureDetector(
                onTap: () {
                  getPlaceList(_addressController.text);
                },
                child: const Icon(
                  Icons.search,
                  color: kBlackColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: _resultCard,
            ),
          ),
        ],
      ),
    );
  }
}
