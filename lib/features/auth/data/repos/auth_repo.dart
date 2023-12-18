import '../models/user_model.dart';

abstract class AuthRepo {
  Future<void> userRegister(UserModel user);
}