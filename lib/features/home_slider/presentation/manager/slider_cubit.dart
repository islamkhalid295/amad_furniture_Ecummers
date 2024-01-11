import 'package:amad_furniture/core/use_case/use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/use_cases/retrive_slider_items_uc.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  final RetriveSliderItemsUC retriveSliderItemsUC;
  SliderCubit(this.retriveSliderItemsUC) : super(SliderInitial());


  void retriveSliderItems ()async
  {
    emit(RetriveSliderItemsLoading());
    try {
      await retriveSliderItemsUC(NoParams());
      emit(RetriveSliderItemsSuccsess());
    }catch(e){
      emit(RetriveSliderItemsError());
    }
  }

}
