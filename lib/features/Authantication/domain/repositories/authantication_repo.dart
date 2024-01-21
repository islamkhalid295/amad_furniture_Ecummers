


import '../../data/data_sources/Authantication_rds.dart';
import '../../data/models/create_account_model.dart';
import '../../data/models/login_model.dart';
import '../../data/models/user_model.dart';
import '../../data/models/verifyForgetPasswordModel.dart';

abstract class AuthanticationRepo {
  Future<String> createAccount (CreateAccountModel createAccountModel);
  Future<UserModel> login(LoginModel loginModel);
  Future<String> forgetPassword(String email);
  Future<String> verifyForgotPassword(VerifyForgetPasswordModel model);
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
  @override
  Future<String> forgetPassword(String email) async {
    return await authanticationRDS.forgetPassword(email);
  }
  @override
  Future<String> verifyForgotPassword(VerifyForgetPasswordModel model) async {
    return await authanticationRDS.verifyForgotPassword(VerifyForgetPasswordModel(token: model.token,newPassword: model.newPassword));

  }
}