import 'package:e_commerce/features/cart/presentation/view/cart_view.dart';
import 'package:e_commerce/features/favourites/presentation/view/favourites_view.dart';
import 'package:e_commerce/features/home/presentation/view/home_view.dart';
import 'package:e_commerce/features/profile/presentation/view/profile_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LayoutProvider extends ChangeNotifier{
  List<Widget> screens = [
     HomeView(),
    const FavouritesView(),
    const CartView(),
    const ProfileView(),
  ];
  int currentIndex = 0;

  changeCurrentIndex({
    required int index,
}){
    currentIndex = index ;
    notifyListeners();
  }
}