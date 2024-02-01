
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../features/home/data/models/product_model.dart';


late String columnId = 'id';
final String columnTitle = 'title';
final String columnImage = 'image';
final String productsTable = 'products_table';
final String columnDescription = 'description';
final String columnPrice = 'price';
final String columnCategory = 'category';
final String columnRate = 'rate';


class Sql {
  late Database db;

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


  Future<ProductModel> insertProducts(ProductModel products) async {
    products.id = await db.insert( productsTable, products.toMap());
    return products;
  }

  Future<int> updateProducts(ProductModel products) async {
    return await db.update(
      productsTable,
      products.toMap(),
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

  Future<List<ProductModel>> getAllProducts() async {
    List<Map<String, dynamic>> produtsMaps = await db.query(productsTable);
    if (produtsMaps.length == 0) {
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
