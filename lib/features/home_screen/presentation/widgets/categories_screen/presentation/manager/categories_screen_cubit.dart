import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:meta/meta.dart';

import '../../../../../../products_screen/data/models/product_info_model.dart';
import '../../../../../../products_screen/data/models/product_list_model.dart';
import '../../data/models/categories_model.dart';
import '../../domain/repositories/categories_repo.dart';

part 'categories_screen_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  // final RetriveCategoriesUC retriveCategoriesUC;
  final CategoriesRepo categoriesRepo;
  CategoriesCubit(this.categoriesRepo) : super(CategoriesInitial());
 static CategoriesList? categoriesList;
 static ProductsListModel? productsListModel;
  static ProductInfo? productInfo;
  static String? selectedProductID;
  static CarouselController carouselController = CarouselController();
  static String imageOnErrorLodingImage = 'https://amadapp.s3.us-east-1.amazonaws.com/slider1.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAS7PIC43H34F6W55W%2F20240112%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240112T130655Z&X-Amz-Expires=14400&X-Amz-Signature=a79d24d8198fa15e94408bc0fc6b91e7aeaf0616e843df08074057946f8365d1&X-Amz-SignedHeaders=host&x-id=GetObject';
static String currentCategoryName = "الكل";
static bool categoryLoaded = false;
static bool poductsLoaded = false;
 bool poductsLoading = false;


  void retriveCategories ()async
  {
    emit(RetriveCategoriesLoading());
    try {
      categoriesList = await categoriesRepo.retriveCategories();
      print(categoriesList?.categories);
      emit(RetriveCategoriesSuccsess());
    }catch(e){
      emit(RetriveCategoriesError());
    }
  }
  Future<void> getProduct(String id)async
  {
    poductsLoading = true;
    emit(GetProductLoading());
    try {
      productInfo = await categoriesRepo.getProduct(id);
      print(productInfo);
      poductsLoading = false;
      emit(GetProductSuccsess());
    }catch(e){
      emit(GetProductError());
      rethrow;
    }
  }
  void getProducts () async
  {
    emit(GetProductsLoading());
    try {
      productsListModel = await categoriesRepo.getProducts();
      //print(productsListModel?.products);
      emit(GetProductsSuccsess());
    }catch(e){
      print(e.toString());
      emit(GetProductsError());
    }
  }
  void getProductsByCategory(String? categoryID)async
  {
    emit(GetProductsLoading());
    if (categoryID != null){
      try {
        productsListModel =
            await categoriesRepo.getProductsByCategory(categoryID);
        print(productsListModel?.products);
        emit(GetProductsSuccsess());

      } catch (e) {
        emit(GetProductsError());

      }
    }else{
      emit(GetProductsError());

    }
  }
  void getProductsBySubCategory(
      String categoryID, String subCategoryID)async
  {
    emit(GetProductsLoading());
    try {
      productsListModel = await categoriesRepo.getProductsBySubCategory(categoryID, subCategoryID);
      print(productsListModel?.products);
      emit(GetProductsSuccsess());

    }catch(e){
      emit(GetProductsError());

    }
  }


}
