import 'package:cedage/core/use_case/use_case.dart';
import '../repositories/authantication_repo.dart';



class ForgetPasswordUC extends UseCase<String,String> {
  final AuthanticationRepo authanticationRepo;

  ForgetPasswordUC({required this.authanticationRepo});
  @override
  Future<String> call(String email) async {
    return await authanticationRepo.forgetPassword(email);
  }
}