import 'package:e_commerce/core/http_services/http_services.dart';
import 'package:flutter/foundation.dart';

import '../../../../auth/data/models/user_model.dart';

class ProfileProvider extends ChangeNotifier{
  late UserModel user ;
  bool isUserDataLoading = true ;

  getUserData()async{
    var data = await HttpServices.getData(path: 'users/1');
    user = UserModel.fromJson(data);
    isUserDataLoading = false;
    notifyListeners();
  }
}