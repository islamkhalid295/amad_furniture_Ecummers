import 'package:cedage/core/use_case/use_case.dart';
import '../../data/models/user.dart';
import '../repositories/authantication_repo.dart';



class GetUserUC extends UseCase<UserData,String> {
  final AuthanticationRepo authanticationRepo;

  GetUserUC({required this.authanticationRepo});
  @override
  Future<UserData> call(String token) async {
    return await authanticationRepo.getUser(token);
  }
}