part of 'categories_screen_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class RetriveCategoriesLoading extends CategoriesState{}
class RetriveCategoriesSuccsess extends CategoriesState{}
class RetriveCategoriesError extends CategoriesState{}

class GetProductLoading extends CategoriesState{}
class GetProductSuccsess extends CategoriesState{}
class GetProductError extends CategoriesState{}

class GetProductsLoading extends CategoriesState{}
class GetProductsSuccsess extends CategoriesState{}
class GetProductsError extends CategoriesState{}

class GetProductsByCategoryLoading extends CategoriesState{}
class GetProductsByCategorySuccsess extends CategoriesState{}
class GetProductsByCategoryError extends CategoriesState{}

class GetProductsBySubCategoryLoading extends CategoriesState{}
class GetProductsBySubCategorySuccsess extends CategoriesState{}
class GetProductsBySubCategoryError extends CategoriesState{}
