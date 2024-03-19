import 'package:cedage/core/use_case/use_case.dart';
import '../../data/models/verifyForgetPasswordModel.dart';
import '../repositories/authantication_repo.dart';



class VerifyForgetPasswordUC extends UseCase<String,VerifyForgetPasswordModel> {
  final AuthanticationRepo authanticationRepo;

  VerifyForgetPasswordUC({required this.authanticationRepo});
  @override
  Future<String> call(VerifyForgetPasswordModel model) async {
    return await authanticationRepo.verifyForgotPassword(VerifyForgetPasswordModel(token: model.token, newPassword: model.newPassword));
  }
}