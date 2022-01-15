import 'package:flutter/material.dart';
import '../../../components/artist_nail_card.dart';
import '../../../controller/designer_controller.dart';

class CategoryScreenDifferentDesignNail extends StatelessWidget {
  final bool isImageOnly;
  CategoryScreenDifferentDesignNail({Key? key, required this.isImageOnly})
      : super(key: key);

  final DesignerController _designerController = DesignerController.to;

  List<Row> _getArtistNailCardList() {
    List<Row> _returnList = [];
    List<ArtistNailCard> _rowList = [];
    for (var designer in _designerController.designerList) {
      for (var imageUrl in designer.designList) {
        if (_rowList.length == 3) {
          _returnList.add(Row(children: _rowList));
          _rowList = [];
        }
        _rowList.add(
          ArtistNailCard(
            designerName: designer.designerName,
            shopAddress: designer.shopAddress,
            imageUrl: imageUrl,
            isImageOnly: isImageOnly,
          ),
        );
      }
    }
    if (_rowList.isNotEmpty) {
      _returnList.add(Row(children: _rowList));
      _rowList = [];
    }
    return _returnList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _getArtistNailCardList(),
    );
  }
}
