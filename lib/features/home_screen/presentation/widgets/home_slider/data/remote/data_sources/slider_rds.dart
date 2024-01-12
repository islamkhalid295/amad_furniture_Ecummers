import 'package:amad_furniture/core/api/api_consummer.dart';

import 'package:amad_furniture/core/api/end_points.dart';

import '../../../domain/models/slider_item_model.dart';

abstract class SliderRDS {
  Future<SliderItemsList> retriveSliderItems ();

}
class SliderRdsImp implements SliderRDS{
  final ApiConsumer client;

  SliderRdsImp({required this.client});
  @override

  Future<SliderItemsList> retriveSliderItems() async{

    final response =
    await client.get("${EndPoints.BASE_URL + EndPoints.GET_SLIDER}");
    SliderItemsList sliderItemsList = SliderItemsList.fromJson(response);
    print(sliderItemsList);
    return sliderItemsList;


    throw UnimplementedError();
  }

}
