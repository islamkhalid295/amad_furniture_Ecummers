abstract class FaqState {}

class FaqInitial extends FaqState {}

class RetriveFaqLoading extends FaqState{}
class RetriveFaqSuccsess extends FaqState{}
class RetriveFaqError extends FaqState{
  final String error;

  RetriveFaqError({required this.error});
}
