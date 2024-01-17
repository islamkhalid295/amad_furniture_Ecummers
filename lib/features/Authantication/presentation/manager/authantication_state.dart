abstract class AuthanticationState {}

class AuthanticationInitial extends AuthanticationState {}

class SendAuthanticationLoading extends AuthanticationState{}
class SendAuthanticationSuccsess extends AuthanticationState{}
class SendAuthanticationError extends AuthanticationState{
  final String error;

  SendAuthanticationError({required this.error});
}
