import 'package:e_commerce/core/http_services/http_services.dart';
import 'package:flutter/foundation.dart';
import '../../../../home/data/models/product_model.dart';

class CartProvider extends ChangeNotifier{
  List<int> cartIds = [];
  List<ProductModel> cartProducts = [];
  bool isCartProductsLoading = true;
  num totalPrice = 0;

  addOrRemoveCart({
    required int productId,
}){
    if(cartIds.contains(productId)){
      cartIds.remove(productId);
    }
    else{
      cartIds.add(productId);
    }
    getAllCart();
    notifyListeners();
  }
  
  Future getAllCart()async{
    isCartProductsLoading = true;
    cartProducts = [];
    totalPrice = 0;
    for(var productId in cartIds){
      var data = await HttpServices.getData(path: 'products/$productId');
      ProductModel product = ProductModel.fromJson(data);
      cartProducts.add(product);
      totalPrice = totalPrice + product.price;
    }
    isCartProductsLoading = false ;
    notifyListeners();
    return cartProducts;
  }
}