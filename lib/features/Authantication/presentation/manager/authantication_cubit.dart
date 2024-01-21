import 'package:amad_furniture/core/storage/flutter_secure_storage.dart';
import 'package:amad_furniture/features/Authantication/data/models/login_model.dart';
import 'package:amad_furniture/features/Authantication/domain/use_cases/create_account_uc.dart';
import 'package:amad_furniture/features/Authantication/domain/use_cases/forget_password_uc.dart';
import 'package:amad_furniture/features/Authantication/domain/use_cases/login_uc.dart';
import 'package:amad_furniture/features/Authantication/domain/use_cases/verify_forget_password_uc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/utils/constantes.dart';
import '../../data/models/create_account_model.dart';
import '../../data/models/user_model.dart';
import '../../data/models/verifyForgetPasswordModel.dart';
import 'authantication_state.dart';

class AuthanticationCubit extends Cubit<AuthanticationState> {
  final CreateAccountUC createAccountUC;
  final LoginUC loginUC;
  final ForgetPasswordUC forgetPasswordUC;
  final VerifyForgetPasswordUC verifyForgetPasswordUC ;


  AuthanticationCubit({required this.storage,required this.verifyForgetPasswordUC,required this.forgetPasswordUC, required this.createAccountUC, required this.loginUC})
      : super(AuthanticationInitial());
  final FlutterSecureStorageCnsummer storage;
  static UserModel? userModel;
  static String? message;
  static var createAccountFormKey = GlobalKey<FormState>();
  static var forgetPasswordFormKey = GlobalKey<FormState>();
  static var verifyForgetPasswordFormKey = GlobalKey<FormState>();
  static var formKey = GlobalKey<FormState>();
  static bool isPassword1 = true;
  static bool isPassword2 = true;
  static bool isPassword3 = true;
  static bool isPassword4 = true;
  static TextEditingController emailController = TextEditingController();
  static TextEditingController nameController = TextEditingController();
  static TextEditingController phoneController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController rePasswordController = TextEditingController();
  static TextEditingController tokenController = TextEditingController();
  static TextEditingController newPasswordController = TextEditingController();

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
    } else {
      return null;
    }
  };
  static FormFieldValidator<String> passwordValidator = (value) {
    if (value!.isEmpty) {
      return 'يجب دخال كلمة السر';
    } else if (value.length<8) {
      return 'كلمة السر يجب ان تكون 8 احرف علي الاقل';
    } else {
      return null;
    }
  };
  static FormFieldValidator<String> rePasswordValidator = (value) {
    if (value!.isEmpty) {
      return 'يجب دخال كلمة السر';
    } else if (passwordController.text != rePasswordController.text) {
      return 'يجب ان تكون كلمتي السر متطابقتان';
    } else if (value.length<8) {
      return 'كلمة السر يجب ان تكون 8 احرف علي الاقل';
    } else {
      return null;
    }
  };
  static FormFieldValidator<String> tokenValidator = (value) {
    if (value!.isEmpty) {
      return 'يجب ادخال كود التفعيل';
    } else if (value.length != verificationCodeLength) {
      return 'كود التفعيل مكون من ${verificationCodeLength} احرف';
    } else {
      return null;
    }
  };


  static AuthanticationCubit get(context) => BlocProvider.of(context);

  void createAccount(CreateAccountModel createAccountModel) async {
    emit(CreateAccountLoading());
    try {
      message = await createAccountUC.call(createAccountModel);
      emit(CreateAccountSuccsess());
    } on DioException catch (e) {
      print("error : ${e.response?.data["message"]}");
      emit(CreateAccountError(error: e.response?.data["message"]));
    }
  }

  void login(LoginModel loginModel) async {
    emit(LoginLoading());
    try {
      userModel = await loginUC.call(loginModel);
storage.setToken(userModel?.token);
      emit(LoginSuccsess());
    } on DioException catch (e) {
      print("error : ${e.response?.data["message"]}");
      emit(LoginError(error: e.response?.data["message"]));
    }
  }
  void forgetPassword(String email) async {
    emit(ForgetPasswordLoading());
    try {
      print(await forgetPasswordUC.call(email));
      emit(ForgetPasswordSuccsess());
    } on DioException catch (e) {
      print("error : ${e.response?.data["message"]}");
      emit(ForgetPasswordError(error: e.response?.data["message"]));
    }
  }
  void verifyForgetPassword(VerifyForgetPasswordModel model) async {
    emit(VerifyForgetPasswordLoading());
    try {
      print(await verifyForgetPasswordUC.call(model));
      emit(VerifyForgetPasswordSuccsess());
    } on DioException catch (e) {
      print("error : ${e.response?.data["message"]}");
      emit(VerifyForgetPasswordError(error: e.response?.data["message"]));
    }
  }

  void showOrHidePassword1() {
    isPassword1 = !isPassword1;
    emit(changePasswordState());
  }
  void showOrHidePassword2() {
    isPassword2 = !isPassword2;
    emit(changePasswordState());
  }
  void showOrHidePassword3() {
    isPassword3 = !isPassword3;
    emit(changePasswordState());
  }
  void showOrHideNewPassword() {
    isPassword4 = !isPassword4;
    emit(changePasswordState());
  }
}
