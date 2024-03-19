import 'package:cedage/core/use_case/use_case.dart';
import 'package:bloc/bloc.dart';

import '../../data/models/about_us_model.dart';
import '../../domain/use_cases/about_us_uc.dart';
import 'about_us_screen_state.dart';


class AboutUsCubit extends Cubit<AboutUsState> {
  final RetriveAboutUsUC retriveAboutUsUC;
  AboutUsCubit(this.retriveAboutUsUC) : super(AboutUsInitial());
 static AboutUsModel? aboutUsModel;

  void retriveAboutUs ()async
  {
    emit(RetriveAboutUsLoading());
    try {
      aboutUsModel = await retriveAboutUsUC.call(NoParams());
      emit(RetriveAboutUsSuccsess());
    }catch(e){
      emit(RetriveAboutUsError());
    }
  }

}
