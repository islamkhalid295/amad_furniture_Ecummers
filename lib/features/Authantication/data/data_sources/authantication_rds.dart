import 'package:amad_furniture/core/api/api_consummer.dart';
import 'package:amad_furniture/core/api/end_points.dart';
import 'package:amad_furniture/features/Authantication/data/models/user_model.dart';
import '../models/create_account_model.dart';
import '../models/login_model.dart';
import '../models/verifyForgetPasswordModel.dart';

abstract class AuthanticationRDS {
  Future<String> createAccount(CreateAccountModel createAccountModel);
  Future<UserModel> login(LoginModel loginModel);
  Future<String> forgetPassword(String email);
  Future<String> verifyForgotPassword(VerifyForgetPasswordModel model);
}

class AuthanticationRdsImp implements AuthanticationRDS {
  final ApiConsumer client;

  AuthanticationRdsImp({required this.client});

  @override
  Future<String> createAccount(CreateAccountModel createAccountModel) async {
      final response = await client.post(
        "${EndPoints.BASE_URL + EndPoints.SIGN_UP}",
        body: createAccountModel.toJson(),
      );
      return response["message"];
  }
  @override
  Future<UserModel> login(LoginModel loginModel) async {
      final response = await client.post(
        "${EndPoints.BASE_URL + EndPoints.LOGIN}",
        body: loginModel.toJson(),
      );
      return UserModel.fromJson(response);
  }

  Future<String> forgetPassword(String email) async {
      final response = await client.post(
        "${EndPoints.BASE_URL + EndPoints.FORGOT_PASSWORD}",
        body: {
          'email' : email
        },
      );
      return response["message"];
  }

  Future<String> verifyForgotPassword(VerifyForgetPasswordModel model) async {
      final response = await client.post(
        "${EndPoints.BASE_URL + EndPoints.VERIFY_FORGOT_PASSWORD}",
        body: {
          'token' : model.token,
          'password' : model.newPassword
        },
      );
      return response["message"];
  }
}
