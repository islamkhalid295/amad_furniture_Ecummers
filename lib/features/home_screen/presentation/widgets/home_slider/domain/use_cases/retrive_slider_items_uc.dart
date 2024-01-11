import 'package:amad_furniture/core/use_case/use_case.dart';

import '../repositories/slider_repo.dart';

class RetriveSliderItemsUC extends UseCase<void,NoParams> {
  final SliderRepo sliderRepo;

  RetriveSliderItemsUC({required this.sliderRepo});
  @override
  Future<void> call(NoParams params) async {
    await sliderRepo.retriveSliderItems();
  }
}