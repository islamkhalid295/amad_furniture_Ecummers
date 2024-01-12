
import '../../data/data_sources/categories_rds.dart';
import '../../data/models/categories_model.dart';

abstract class CategoriesRepo {
  Future<CategoriesList> retriveCategories ();
}

class CategoriesRepoImp implements CategoriesRepo{
  final CategoriesRDS categoriesRDS;

  CategoriesRepoImp({required this.categoriesRDS});
  @override
  Future<CategoriesList> retriveCategories() async {
     return await categoriesRDS.retriveCategories();
  }

}