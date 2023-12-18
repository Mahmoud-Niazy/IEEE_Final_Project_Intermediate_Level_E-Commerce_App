import 'package:e_commerce/core/api_services/api_services.dart';
import 'package:e_commerce/features/auth/data/models/user_model.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  ApiServices apiServices;

  AuthRepoImp(this.apiServices);

  @override
  Future<void> userRegister(UserModel user) async{
    await apiServices.postData(
      path: 'users',
      data: user.toMap(),
    );
  }
}
