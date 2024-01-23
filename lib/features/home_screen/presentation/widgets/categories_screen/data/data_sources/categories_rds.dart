import 'package:amad_furniture/core/api/api_consummer.dart';
import 'package:amad_furniture/core/api/end_points.dart';
import 'package:amad_furniture/features/products_screen/data/models/product_list_model.dart';

import '../models/categories_model.dart';

abstract class CategoriesRDS {
  Future<CategoriesList> retriveCategories ();
  Future<Product> getProduct(String id);
  Future<ProductsListModel> getProducts ();
  Future<ProductsListModel> getProductsByCategory (String categoryID);
  Future<ProductsListModel> getProductsBySubCategory (String categoryID,String subCategoryID);

}
class CategoriesRdsImp implements CategoriesRDS{
  final ApiConsumer client;

  CategoriesRdsImp({required this.client});
  @override
  Future<CategoriesList> retriveCategories() async{
    final response =
    await client.get("${EndPoints.BASE_URL + EndPoints.GET_CATEGORIES}");
    CategoriesList categoriesList = CategoriesList.fromJson(response);
    print(categoriesList);
    return categoriesList;

    throw UnimplementedError();
  }

  @override
  Future<Product> getProduct(String id) async{
    final response =
        await client.get("${EndPoints.BASE_URL + EndPoints.GET_PRODUCT + id}");
    Product product = Product.fromJson(response);
    print(product);
    return product;
  }

  @override
  Future<ProductsListModel> getProducts() async{
    final response =
        await client.get("${EndPoints.BASE_URL + EndPoints.GET_PRODUCTS}");
    ProductsListModel productsListModel = ProductsListModel.fromJson(response);
    print(productsListModel);
    return productsListModel;
  }

  @override
  Future<ProductsListModel> getProductsByCategory(String categoryID) async{
    final response =
        await client.get("${EndPoints.BASE_URL + EndPoints.GET_PRODUCTS_BY_CAT + categoryID}");
    ProductsListModel productsListModel = ProductsListModel.fromJson(response);
    print(productsListModel);
    return productsListModel;
  }

  @override
  Future<ProductsListModel> getProductsBySubCategory(String categoryID, String subCategoryID) async{
    final response =
        await client.get("${EndPoints.BASE_URL + EndPoints.GET_PRODUCTS_BY_SUB_CAT + categoryID}/$subCategoryID");
    ProductsListModel productsListModel = ProductsListModel.fromJson(response);
    print(productsListModel);
    return productsListModel;
  }

}
