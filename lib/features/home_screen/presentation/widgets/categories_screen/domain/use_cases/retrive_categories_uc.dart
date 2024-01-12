import 'package:amad_furniture/core/use_case/use_case.dart';

import '../../data/models/categories_model.dart';
import '../repositories/categories_repo.dart';

class RetriveCategoriesUC extends UseCase<void,NoParams> {
  final CategoriesRepo sliderRepo;

  RetriveCategoriesUC({required this.sliderRepo});
  @override
  Future<CategoriesList> call(NoParams params) async {
    return await sliderRepo.retriveCategories();
  }
}