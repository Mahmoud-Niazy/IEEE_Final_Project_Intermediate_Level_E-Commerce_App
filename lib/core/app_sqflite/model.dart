// import 'package:e_commerce/core/app_sqflite/sql.dart';
//
// class Products {
//   int? id;
//   late String title;
//   late String description;
//   late num price;
//   late String image;
//
//
//   Products({
//     this.id,
//     required this.title,
//     required this.image,
//     required this.price,
//     required this.description,
//
//
//   });
//
//   Products.fromMap(Map<String, dynamic> map) {
//     if (map[columnId] != null)
//       id = map[columnId];
//     title = map[columnTitle];
//     image = map[columnURL];
//
//   }
//
//   Map<String, dynamic> toMap() {
//     Map<String, dynamic> map = {};
//     if (id != null) map[columnId] = id;
//     map[columnTitle] = title;
//     map[columnURL] = image;
//
//     return map;
//   }
// }