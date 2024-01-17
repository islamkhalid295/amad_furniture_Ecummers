


import '../../data/data_sources/Authantication_rds.dart';
import '../../data/models/create_account_model.dart';

abstract class AuthanticationRepo {
  Future<String> createAccount (CreateAccountModel createAccountModel);
}

class AuthanticationRepoImp implements AuthanticationRepo{
  final AuthanticationRDS authanticationRDS;

  AuthanticationRepoImp({required this.authanticationRDS});
  @override
  Future<String> createAccount(CreateAccountModel createAccountModel) async {
     return await authanticationRDS.createAccount(createAccountModel);
  }

}