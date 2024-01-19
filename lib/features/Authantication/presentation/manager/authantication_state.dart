abstract class AuthanticationState {}

class AuthanticationInitial extends AuthanticationState {}

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
