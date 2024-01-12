

import '../../../categories_screen/data/data_sources/categories_rds.dart';
import '../../data/remote/data_sources/slider_rds.dart';
import '../models/slider_item_model.dart';

abstract class SliderRepo {
  Future<SliderItemsList> retriveSliderItems ();

}

class SliderRepoImp implements SliderRepo{
  final SliderRDS sliderRDS;

  SliderRepoImp({required this.sliderRDS});
  @override

  Future<SliderItemsList> retriveSliderItems() async {
     return await sliderRDS.retriveSliderItems();

  }

}