import 'package:amad_furniture/core/use_case/use_case.dart';
import 'package:bloc/bloc.dart';
import '../../data/models/faq_model.dart';
import '../../domain/use_cases/retrive_faq_uc.dart';
import 'faq_state.dart';


class FaqCubit extends Cubit<FaqState> {
  final RetriveFaqUC retriveFaqUC;
  FaqCubit(this.retriveFaqUC) : super(FaqInitial());
  static FaqList? faqList;

  void retriveFaq ()async
  {
    emit(RetriveFaqLoading());
    try {
      faqList = await retriveFaqUC.call(NoParams());
      print(faqList?.faq);
      emit(RetriveFaqSuccsess());
    }catch(e){
      print(e.toString());
      emit(RetriveFaqError(error: e.toString()));
    }
  }

}
