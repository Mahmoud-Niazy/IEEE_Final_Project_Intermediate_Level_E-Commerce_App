import 'package:e_commerce/features/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../../data/repos/auth_repo.dart';

class UserRegisterProvider extends ChangeNotifier{
  AuthRepo authRepo ;

  UserRegisterProvider(this.authRepo);
  Future<void> userRegister(UserModel user)async{
    await authRepo.userRegister(user);
  }
}