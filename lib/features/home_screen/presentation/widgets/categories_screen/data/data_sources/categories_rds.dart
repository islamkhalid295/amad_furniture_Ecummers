import 'package:amad_furniture/core/api/api_consummer.dart';
import 'package:amad_furniture/core/api/end_points.dart';

import '../models/categories_model.dart';

abstract class CategoriesRDS {
  Future<CategoriesList> retriveCategories ();
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

}
