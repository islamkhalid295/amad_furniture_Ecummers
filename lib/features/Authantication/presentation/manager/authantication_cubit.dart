import 'package:amad_furniture/core/exceptions/server/server_exception.dart';
import 'package:amad_furniture/features/Authantication/data/models/login_model.dart';
import 'package:amad_furniture/features/Authantication/domain/use_cases/create_account_uc.dart';
import 'package:amad_furniture/features/Authantication/domain/use_cases/login_uc.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/create_account_model.dart';
import '../../data/models/user_model.dart';
import 'authantication_state.dart';


class AuthanticationCubit extends Cubit<AuthanticationState> {
  final CreateAccountUC createAccountUC;
  final LoginUC loginUC;

  AuthanticationCubit({required this.createAccountUC, required this.loginUC}) : super(AuthanticationInitial());
  UserModel? userModel;
  static String? message;
  static var formKey = GlobalKey<FormState>();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController nameController = TextEditingController();
  static TextEditingController phoneController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController rePasswordController = TextEditingController();
  static FormFieldValidator<String> emailValidator = (value) {
    if (value!.isEmpty) {
      return 'يجب ادخال البريد الإلكتروني';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    } else {
      return null;
    }
  };
  static FormFieldValidator<String> nameValidator = (value) {
    if (value!.isEmpty) {
      return 'يجب ادخال الاسم';
    } else {
      return null;
    }
  };
  static FormFieldValidator<String> phoneValidator = (value) {
    if (value!.isEmpty) {
      return 'يجب ادخال رقم الهاتف';
    } else if (!RegExp(r'^\+\d{1,4}\d{6,}$').hasMatch(value)) {
      return 'يرجي ادخال كود الدولة متبوعاً برقم الهاتف +20115222222';
    }
    else {
      return null;
    }
  };
  static FormFieldValidator<String> passwordValidator = (value) {
    if (value!.isEmpty) {
      return 'يجب دخال السر';
    } else {
      return null;
    }
  };
  static FormFieldValidator<String> rePasswordValidator = (value) {
    if (value!.isEmpty) {
      return 'يجب دخال السر';
    } else if (passwordController.text != rePasswordController.text){
      return 'يجب ان تكون كلمتي السر متطابقتان';
    } else {
      return null;
    }
  };

  static AuthanticationCubit get(context) => BlocProvider.of(context);

   void createAccount (CreateAccountModel createAccountModel)async
  {
    emit(CreateAccountLoading());
    try {
      message = await createAccountUC.call(createAccountModel);
      emit(CreateAccountSuccsess());
    } on DioException catch (e){

      print("error : ${e.response?.data["message"]}");
      emit(CreateAccountError(error: e.response?.data["message"]));
    }
  }
   void login (LoginModel loginModel)async
  {
    emit(LoginLoading());
    try {
      userModel = await loginUC.call(loginModel);
      emit(LoginSuccsess());
    } on DioException catch (e){

      print("error : ${e.response?.data["message"]}");
      emit(LoginError(error: e.response?.data["message"]));
    }
  }

}
