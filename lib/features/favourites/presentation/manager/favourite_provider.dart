import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FavouriteProvider extends ChangeNotifier {

  Color _iconColor = Colors.white60;
  bool _isFavourite = false;

  Color get iconColor => _iconColor;
  bool get isFavourite => _isFavourite;

  void toggleFavourite() {
    _isFavourite = !_isFavourite;
    _iconColor = _isFavourite ? Colors.red : Colors.white60;
    notifyListeners();
  }
}
