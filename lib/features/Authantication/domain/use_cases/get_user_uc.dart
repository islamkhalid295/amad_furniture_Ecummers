import 'package:amad_furniture/core/use_case/use_case.dart';
import 'package:amad_furniture/features/Authantication/data/models/create_account_model.dart';
import '../../data/models/login_model.dart';
import '../../data/models/user.dart';
import '../../data/models/user_model.dart';
import '../repositories/authantication_repo.dart';



class GetUserUC extends UseCase<UserData,String> {
  final AuthanticationRepo authanticationRepo;

  GetUserUC({required this.authanticationRepo});
  @override
  Future<UserData> call(String token) async {
    return await authanticationRepo.getUser(token);
  }
}