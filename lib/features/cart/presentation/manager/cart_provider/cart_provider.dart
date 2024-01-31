import 'package:e_commerce/core/http_services/http_services.dart';
import 'package:flutter/foundation.dart';
import '../../../../home/data/models/product_model.dart';

class CartProvider extends ChangeNotifier{
  List<int> cart = [];
  List<ProductModel> cartProducts = [];

  addOrRemoveCart({
    required int productId,
}){
    if(cart.contains(productId)){
      cart.remove(productId);
    }
    else{
      cart.add(productId);
    }
    notifyListeners();
  }
  
  Future getAllCart()async{
    for(var productId in cart){
      var data = await HttpServices.getData(path: 'products/$productId');
      ProductModel product = ProductModel.fromJson(data);
      print(product.price);
      cartProducts.add(product);
    }
  }
}