
import '../../data/remote/data_sources/slider_rds.dart';

abstract class SliderRepo {
  Future<void> retriveSliderItems ();
}

class SliderRepoImp implements SliderRepo{
  final SliderRDS sliderRDS;

  SliderRepoImp({required this.sliderRDS});
  @override
  Future<void> retriveSliderItems() async {
     await sliderRDS.retriveSliderItems();
  }

}