import 'package:e_commerce/core/app_sqflite/sql.dart';
import 'package:flutter/foundation.dart';

import '../../../home/data/models/product_model.dart';

class FavouriteProvider extends ChangeNotifier {
  late ProductModel product;

  Future<List<ProductModel>> favoriteProductIds = Sql.instance.getAllProducts();

  Future<bool> isProductInFavorites(int productId) async {
    List<ProductModel> products = await favoriteProductIds;
    return products.any((product) => product.id == productId);
  }

  addProductToFavorites(int productId , ) async {
    bool isAlreadyInFavorites = await isProductInFavorites(productId);

    if (!isAlreadyInFavorites) {
      await Sql.instance.insertProducts(
        ProductModel(
          title: product.title,
          image: product.image,
          price: product.price,
          description: product.description,
          id: product.id,
          category: product.category,
        ),
      );
      favoriteProductIds = Sql.instance.getAllProducts();
      notifyListeners();
    }
  }

  removeProductFromFavorites(int productId) async {
    bool isAlreadyInFavorites = await isProductInFavorites(productId);

    if (isAlreadyInFavorites) {
      await Sql.instance.deleteProducts(productId);
      favoriteProductIds = Sql.instance.getAllProducts();
      notifyListeners();
    }
  }
}
