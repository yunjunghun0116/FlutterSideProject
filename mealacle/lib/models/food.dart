import 'dart:convert';

class Food {
  final String id;
  final String descriptionImage;
  final String name;
  final String origin;
  final String price;
  final int sellerIndex;
  final String sellerName;
  final String sellerId;
  final int stock;
  final List image;
  final List options;
  final String? storedTime;
  final int? selectedOptionIndex;
  final int? selectedCount;
  final String? selectedOptionPrice;

  Food({
    required this.id,
    required this.descriptionImage,
    required this.name,
    required this.origin,
    required this.price,
    required this.sellerIndex,
    required this.sellerName,
    required this.sellerId,
    required this.stock,
    required this.image,
    required this.options,
    this.storedTime,
    this.selectedOptionIndex,
    this.selectedCount,
    this.selectedOptionPrice,
  });
  // firebase로부터 가져온 food를 데이터가공하는부분
  factory Food.fromMap(Map<String, dynamic> json) => Food(
        id: json['id'],
        descriptionImage: json['description'],
        name: json['name'],
        origin: json['origin'],
        price: json['price'],
        sellerIndex: json['seller']['profile_idx'],
        sellerName: json['seller']['profile_name'],
        sellerId: json['seller']['sellerid'],
        stock: json['stock'],
        image: json['image'],
        options: json['options'],
      );
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descriptionImage': descriptionImage,
      'name': name,
      'origin': origin,
      'price': price,
      'sellerIndex': sellerIndex,
      'sellerName': sellerName,
      'sellerId': sellerId,
      'stock': stock,
      'image': image,
      'options': options,
      'storedTime': DateTime.now().toString(),
    };
  }
  // sharedPreference
  factory Food.fromStorageMap(Map<String, dynamic> json) => Food(
        id: json['id'],
        descriptionImage: json['descriptionImage'],
        name: json['name'],
        origin: json['origin'],
        price: json['price'],
        sellerIndex: json['sellerIndex'],
        sellerName: json['sellerName'],
        sellerId: json['sellerId'],
        stock: json['stock'],
        image: json['image'],
        options: json['options'],
        storedTime: json['storedTime'],
        selectedOptionIndex: json['selectedOptionIndex'],
        selectedOptionPrice: json['selectedOptionPrice'],
        selectedCount: json['selectedCount'],
      );

  Map<String, dynamic> toStorageMap() {
    return {
      'id': id,
      'descriptionImage': descriptionImage,
      'name': name,
      'origin': origin,
      'price': price,
      'sellerIndex': sellerIndex,
      'sellerName': sellerName,
      'sellerId': sellerId,
      'stock': stock,
      'image': image,
      'options': options,
      'storedTime': DateTime.now().toString(),
      'selectedOptionIndex':selectedOptionIndex,
      'selectedOptionPrice':selectedOptionPrice,
      'selectedCount':selectedCount,
    };
  }

  String toJsonString() {
    return jsonEncode(toStorageMap());
  }
}
