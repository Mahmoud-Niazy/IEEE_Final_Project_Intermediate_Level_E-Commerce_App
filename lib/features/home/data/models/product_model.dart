import '../../../../core/app_sqflite/sql.dart';

class ProductModel {
  late final int id;
  final String title;
  final String description;
  final num price;
  final String category;
  final  String image;
  final num? rate;

  ProductModel({
    required this.title,
    required this.image,
    required this.id,
    required this.price,
    required this.category,
    required this.description,
    this.rate,

  });

  // is User for getting Data From API
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'],
      image: json['image'],
      id: json['id'],
      price: json['price'],
      category: json['category'],
      description: json['description'],
      rate:json['rating']['rate'],
    );
  }

  // is Used For getting Data From SQL
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map[columnId],
      title: map[columnTitle],
      image: map[columnImage],
      price: map[columnPrice],
      category: map[columnCategory],
      description: map[columnDescription],
      rate: map[columnRate],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map[columnId] = id;
    map[columnTitle] = title;
    map[columnImage] = image;
    map[columnPrice] = price;
    map[columnCategory] = category;
    map[columnDescription] = description;
    map[columnRate] = rate;

    return map;
  }
}
