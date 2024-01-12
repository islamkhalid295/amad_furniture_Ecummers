import 'package:amad_furniture/core/use_case/use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:meta/meta.dart';

import '../../data/models/categories_model.dart';
import '../../domain/use_cases/retrive_categories_uc.dart';

part 'categories_screen_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final RetriveCategoriesUC retriveCategoriesUC;
  CategoriesCubit(this.retriveCategoriesUC) : super(CategoriesInitial());
 static CategoriesList? categoriesList;
  static CarouselController carouselController = CarouselController();
  static String imageOnErrorLodingImage = 'https://amadapp.s3.us-east-1.amazonaws.com/slider1.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAS7PIC43H34F6W55W%2F20240112%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240112T130655Z&X-Amz-Expires=14400&X-Amz-Signature=a79d24d8198fa15e94408bc0fc6b91e7aeaf0616e843df08074057946f8365d1&X-Amz-SignedHeaders=host&x-id=GetObject';

  void retriveCategories ()async
  {
    emit(RetriveCategoriesLoading());
    try {
      categoriesList = await retriveCategoriesUC.call(NoParams());
      print(categoriesList?.categories);
      emit(RetriveCategoriesSuccsess());
    }catch(e){
      emit(RetriveCategoriesError());
    }
  }

}
