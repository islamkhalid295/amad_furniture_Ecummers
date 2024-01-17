import 'package:amad_furniture/core/use_case/use_case.dart';
import 'package:amad_furniture/features/Authantication/data/models/create_account_model.dart';
import '../repositories/authantication_repo.dart';



class CreateAccountUC extends UseCase<String,CreateAccountModel> {
  final AuthanticationRepo authanticationRepo;

  CreateAccountUC({required this.authanticationRepo});
  @override
  Future<String> call(CreateAccountModel createAccountModel) async {
    return await authanticationRepo.createAccount(createAccountModel);
  }
}