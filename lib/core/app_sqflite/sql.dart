
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../features/home/data/models/product_model.dart';


const String columnId = 'id';
const String columnTitle = 'title';
const String columnImage = 'image';
const String productsTable = 'products_table';
const String columnDescription = 'description';
const String columnPrice = 'price';
const String columnCategory = 'category';
const String columnRate = 'rate';


class Sql {
  static late Database db;

  static final Sql instance = Sql._internal();

  factory Sql() {
    return instance;
  }

  Sql._internal();

  Future open() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'contact.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE $productsTable (
          $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
          $columnTitle TEXT NOT NULL,
          $columnImage TEXT NOT NULL,
          $columnDescription TEXT NOT NULL,
          $columnPrice INTEGER,
          $columnCategory TEXT NOT NULL,  
          $columnRate INTEGER  
        )
      ''');
      },
    );
  }


  static Future insertProducts(ProductModel product) async {
   await db.insert( productsTable, product.toJson());
  }

  Future<int> updateProducts(ProductModel products) async {
    return await db.update(
      productsTable,
      products.toJson(),
      where: '$columnId = ?',
      whereArgs: [products.id],
    );
  }

  Future<int> deleteProducts(int id) async {
    return await db.delete(
      productsTable,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }


  static Future<List<ProductModel>> getAllProducts() async {
    List<Map<String, dynamic>> produtsMaps = await db.query(productsTable);
    if (produtsMaps.isEmpty) {
      return [];
    } else {
      List<ProductModel> products = [];
      for (var element in produtsMaps) {
        products.add(ProductModel.fromMap(element));
      }
      return products;
    }
  }


  Future close() async => db.close();


}
