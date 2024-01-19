import 'package:amad_furniture/core/api/api_consummer.dart';
import 'package:amad_furniture/core/api/end_points.dart';
import 'package:amad_furniture/features/Authantication/data/models/user_model.dart';
import 'package:amad_furniture/features/home_screen/presentation/widgets/contact_us_screen/data/models/contatct_us_model.dart';
import 'package:dio/dio.dart';

import '../models/create_account_model.dart';
import '../models/login_model.dart';

abstract class AuthanticationRDS {
  Future<String> createAccount(CreateAccountModel createAccountModel);
  Future<UserModel> login(LoginModel loginModel);
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
}
