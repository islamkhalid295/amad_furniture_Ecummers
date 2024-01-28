import '../../../../../../products_screen/data/models/product_info_model.dart';
import '../../../../../../products_screen/data/models/product_list_model.dart';
import '../../data/data_sources/categories_rds.dart';
import '../../data/models/categories_model.dart';

abstract class CategoriesRepo {
  Future<CategoriesList> retriveCategories();

  Future<ProductInfo?> getProduct(String id);

  Future<ProductsListModel> getProducts();

  Future<ProductsListModel> getProductsByCategory(String categoryID);

  Future<ProductsListModel> getProductsBySubCategory(
      String categoryID, String subCategoryID);
}

class CategoriesRepoImp implements CategoriesRepo {
  final CategoriesRDS categoriesRDS;

  CategoriesRepoImp({required this.categoriesRDS});

  @override
  Future<CategoriesList> retriveCategories() async {
    return await categoriesRDS.retriveCategories();
  }

  @override
  Future<ProductInfo?> getProduct(String id) async {
    return await categoriesRDS.getProduct(id);
  }

  @override
  Future<ProductsListModel> getProducts() async {
    return await categoriesRDS.getProducts();
  }

  @override
  Future<ProductsListModel> getProductsByCategory(String categoryID) async {
    return await categoriesRDS.getProductsByCategory(categoryID);
  }

  @override
  Future<ProductsListModel> getProductsBySubCategory(
      String categoryID, String subCategoryID) async {
    return await categoriesRDS.getProductsBySubCategory(
        categoryID, subCategoryID);
  }
}
