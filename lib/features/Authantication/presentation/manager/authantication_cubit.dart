import 'package:amad_furniture/core/storage/flutter_secure_storage.dart';
import 'package:amad_furniture/features/Authantication/data/models/login_model.dart';
import 'package:amad_furniture/features/Authantication/domain/use_cases/create_account_uc.dart';
import 'package:amad_furniture/features/Authantication/domain/use_cases/forget_password_uc.dart';
import 'package:amad_furniture/features/Authantication/domain/use_cases/get_user_uc.dart';
import 'package:amad_furniture/features/Authantication/domain/use_cases/login_uc.dart';
import 'package:amad_furniture/features/Authantication/domain/use_cases/verify_forget_password_uc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/storage/storage_consummer.dart';
import '../../../../core/utils/constantes.dart';
import '../../../../core/utils/routes_manager.dart';
import '../../data/models/create_account_model.dart';
import '../../data/models/user.dart';
import '../../data/models/user_model.dart';
import '../../data/models/verifyForgetPasswordModel.dart';
import 'authantication_state.dart';

class AuthanticationCubit extends Cubit<AuthanticationState> {
  final CreateAccountUC createAccountUC;
  final LoginUC loginUC;
  final ForgetPasswordUC forgetPasswordUC;
  final VerifyForgetPasswordUC verifyForgetPasswordUC;

  final GetUserUC getUserUC;

  AuthanticationCubit(
      {required this.getUserUC,
      required this.verifyForgetPasswordUC,
      required this.forgetPasswordUC,
      required this.createAccountUC,
      required this.loginUC})
      : super(AuthanticationInitial());
  static StorageConsumer? storage;

  static UserModel? userModel;
  static UserData? userData;
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
  static TextEditingController firstNameController = TextEditingController();
  static TextEditingController secondNameController = TextEditingController();
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
    } else if (value.length < 8) {
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
    } else if (value.length < 8) {
      return 'كلمة السر يجب ان تكون 8 احرف علي الاقل';
    } else {
      return null;
    }
  };
  static FormFieldValidator<String> tokenValidator = (value) {
    if (value!.isEmpty) {
      return 'يجب ادخال كود التفعيل';
    } else if (value.length != verificationCodeLength) {
      return 'كود التفعيل مكون من $verificationCodeLength احرف';
    } else {
      return null;
    }
  };

  static AuthanticationCubit get(context) => BlocProvider.of(context);

  static void init() {
    storage = FlutterSecureStorageCnsummer(const FlutterSecureStorage());
  }

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

  void login(LoginModel loginModel, BuildContext context) async {
    emit(LoginLoading());
    try {
      userModel = await loginUC.call(loginModel);
      storage?.setToken(userModel?.token);
      token = userModel?.token;
      emit(LoginSuccsess());
      passwordController.text="";
      context.go(RoutesManager.homeScreen);
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


  void getToken() {
    emit(GetTokenLoading());
    try {
      storage?.getToken().then((value) {
        token = value.toString();
        emit(GetTokenSuccsess());
        if (token != "null" && token != null) {
          getUser(token??"");
        }
      });
    } catch (e) {
      emit(GetTokenError());
      print(e.toString());
    }
  }

  void getUser(String token) {
    emit(GetUserLoading());
    try {
      getUserUC.call(token).then((value) {
        userData = value;
        print(value.toString());
        userModel = UserModel(
            email: value.user?.email,
            name: value.user?.name,
            token: token,
            number: value.user?.number);
        emit(GetUserSuccsess());
      });
    } catch (e) {
      emit(GetUserError(e.toString()));
    }
  }
  void logout (){
    storage?.deleteToken();
    token = null;
    userData = null;
    userModel = null;
    emit(LogoutState());
  }
}
//eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiSXNsYW0gS2hhbGlkIiwiZW1haWwiOiJpc2xhbWtoYWxpZDI5NUBnbWFpbC5jb20iLCJudW1iZXIiOiIrMjAxMDkxODMyODI5Iiwicm9sZSI6ImNsaWVudCIsImlhdCI6MTcwNjMwNjg4NX0.5sKWoy5im1TUPLmIka4tPw1x5QbiXZc2o74qPMW0FBY
