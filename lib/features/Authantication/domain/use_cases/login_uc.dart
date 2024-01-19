import 'package:amad_furniture/core/use_case/use_case.dart';
import 'package:amad_furniture/features/Authantication/data/models/create_account_model.dart';
import '../../data/models/login_model.dart';
import '../../data/models/user_model.dart';
import '../repositories/authantication_repo.dart';



class LoginUC extends UseCase<UserModel,LoginModel> {
  final AuthanticationRepo authanticationRepo;

  LoginUC({required this.authanticationRepo});
  @override
  Future<UserModel> call(LoginModel loginModel) async {
    return await authanticationRepo.login(loginModel);
  }
}