


import '../../data/data_sources/Authantication_rds.dart';
import '../../data/models/create_account_model.dart';
import '../../data/models/login_model.dart';
import '../../data/models/user_model.dart';

abstract class AuthanticationRepo {
  Future<String> createAccount (CreateAccountModel createAccountModel);
  Future<UserModel> login(LoginModel loginModel);

}

class AuthanticationRepoImp implements AuthanticationRepo{
  final AuthanticationRDS authanticationRDS;

  AuthanticationRepoImp({required this.authanticationRDS});
  @override
  Future<String> createAccount(CreateAccountModel createAccountModel) async {
    return await authanticationRDS.createAccount(createAccountModel);
  }
  @override
  Future<UserModel> login(LoginModel loginModel) async {
    return await authanticationRDS.login(loginModel);
  }

}