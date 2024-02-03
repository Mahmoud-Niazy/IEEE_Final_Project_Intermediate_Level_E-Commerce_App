import 'package:e_commerce/core/http_services/http_services.dart';
import 'package:flutter/foundation.dart';

import '../../../data/models/product_model.dart';

class HomeProvider extends ChangeNotifier{
  bool isCategoriesLoading = false;
  List<String> categories = [];

  getAllCategories()async{
    isCategoriesLoading = true;
    var data = await HttpServices.getData(path: 'products/categories');
    for (var element in data) {
      categories.add(element);
    }
    isCategoriesLoading = false;
    notifyListeners();
  }

  bool isProductsLoading = false;
  List<ProductModel> products = [] ;
  getAllProducts()async{
    products = [];
    isProductsLoading = true ;
    notifyListeners();
    var data = await HttpServices.getData(path: 'products');
    for(var element in data){
      products.add(ProductModel.fromJson(element));
    }
    isProductsLoading = false;
    notifyListeners();
  }

  getProductsSpecificInCategory({
    required String category,
})async{
    products = [];
    isProductsLoading = true ;
    notifyListeners();
    var data = await HttpServices.getData(path: 'products/category/$category');
    for(var element in data){
      products.add(ProductModel.fromJson(element));
    }
    isProductsLoading = false;
    notifyListeners();

  }
}