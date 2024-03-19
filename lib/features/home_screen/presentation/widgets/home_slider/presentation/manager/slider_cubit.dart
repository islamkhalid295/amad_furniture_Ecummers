import 'package:cedage/core/use_case/use_case.dart';

import 'package:cedage/features/home_screen/presentation/widgets/home_slider/domain/models/slider_item_model.dart';

import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:meta/meta.dart';

import '../../domain/use_cases/retrive_slider_items_uc.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  final RetriveSliderItemsUC retriveSliderItemsUC;
  SliderCubit(this.retriveSliderItemsUC) : super(SliderInitial());

 static SliderItemsList? sliderItemsList;
  static CarouselController carouselController = CarouselController();
  static String imageOnErrorLodingImage = 'https://amadapp.s3.us-east-1.amazonaws.com/slider1.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAS7PIC43H34F6W55W%2F20240112%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240112T130655Z&X-Amz-Expires=14400&X-Amz-Signature=a79d24d8198fa15e94408bc0fc6b91e7aeaf0616e843df08074057946f8365d1&X-Amz-SignedHeaders=host&x-id=GetObject';


  void retriveSliderItems ()async
  {
    emit(RetriveSliderItemsLoading());
    try {

      sliderItemsList = await retriveSliderItemsUC.call(NoParams());
      print(sliderItemsList?.slider);

      emit(RetriveSliderItemsSuccsess());
    }catch(e){
      emit(RetriveSliderItemsError());
    }
  }


  void getNextPage(){
    carouselController.nextPage();
    emit(GetNextPage());
  }
  void getPreviousPage(){
    carouselController.previousPage();
    emit(GetPreviousPage());
  }
}
