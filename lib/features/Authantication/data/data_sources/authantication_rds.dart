import 'package:amad_furniture/core/api/api_consummer.dart';
import 'package:amad_furniture/core/api/end_points.dart';
import 'package:amad_furniture/features/home_screen/presentation/widgets/contact_us_screen/data/models/contatct_us_model.dart';
import 'package:dio/dio.dart';

import '../models/create_account_model.dart';

abstract class AuthanticationRDS {
  Future<String> createAccount(CreateAccountModel createAccountModel);
}

class AuthanticationRdsImp implements AuthanticationRDS {
  final ApiConsumer client;

  AuthanticationRdsImp({required this.client});

  @override
  Future<String> createAccount(CreateAccountModel createAccountModel) async {
      final response = await client.post(
        "${EndPoints.BASE_URL + EndPoints.SIGN_UP}",
        body: {
          "email": "islamkhalid295@gmail.com",
          "name":"string",
          "password":"sdddfsdgfg",
          "number":"+201152222222"
        },
      );
      return response["message"];
  }
}
