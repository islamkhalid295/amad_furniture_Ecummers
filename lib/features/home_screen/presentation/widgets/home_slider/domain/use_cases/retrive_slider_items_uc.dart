import 'package:amad_furniture/core/use_case/use_case.dart';

import '../models/slider_item_model.dart';
import '../repositories/slider_repo.dart';

class RetriveSliderItemsUC extends UseCase<void,NoParams> {
  final SliderRepo sliderRepo;

  RetriveSliderItemsUC({required this.sliderRepo});
  @override
  Future<SliderItemsList> call(NoParams params) async {
    return await sliderRepo.retriveSliderItems();
  }
}