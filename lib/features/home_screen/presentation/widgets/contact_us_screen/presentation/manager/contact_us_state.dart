abstract class ContactUsState {}

class ContactUsInitial extends ContactUsState {}

class SendContactUsLoading extends ContactUsState{}
class SendContactUsSuccsess extends ContactUsState{}
class SendContactUsError extends ContactUsState{
  final String error;

  SendContactUsError({required this.error});
}
