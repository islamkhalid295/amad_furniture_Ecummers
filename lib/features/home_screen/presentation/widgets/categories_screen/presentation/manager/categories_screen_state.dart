part of 'categories_screen_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class RetriveCategoriesLoading extends CategoriesState{}
class RetriveCategoriesSuccsess extends CategoriesState{}
class RetriveCategoriesError extends CategoriesState{}
