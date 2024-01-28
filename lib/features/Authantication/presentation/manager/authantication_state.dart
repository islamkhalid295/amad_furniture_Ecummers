abstract class AuthanticationState {}

class AuthanticationInitial extends AuthanticationState {}
class changePasswordState extends AuthanticationState {}

class CreateAccountLoading extends AuthanticationState{}
class CreateAccountSuccsess extends AuthanticationState{}
class CreateAccountError extends AuthanticationState{
  final String error;

  CreateAccountError({required this.error});
}
class LoginLoading extends AuthanticationState{}
class LoginSuccsess extends AuthanticationState{}
class LoginError extends AuthanticationState{
  final String error;

  LoginError({required this.error});
}

class ForgetPasswordLoading extends AuthanticationState{}
class ForgetPasswordSuccsess extends AuthanticationState{}
class ForgetPasswordError extends AuthanticationState{
  final String error;

  ForgetPasswordError({required this.error});
}

class VerifyForgetPasswordLoading extends AuthanticationState{}
class VerifyForgetPasswordSuccsess extends AuthanticationState{}
class VerifyForgetPasswordError extends AuthanticationState{
  final String error;

  VerifyForgetPasswordError({required this.error});
}


class GetTokenLoading extends AuthanticationState{}
class GetTokenSuccsess extends AuthanticationState{}
class GetTokenError extends AuthanticationState{}

class GetUserLoading extends AuthanticationState{}
class GetUserSuccsess extends AuthanticationState{}
class GetUserError extends AuthanticationState{
  final String error;

  GetUserError(this.error);
}
