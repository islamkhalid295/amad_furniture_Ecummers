import 'package:amad_furniture/core/api/api_consummer.dart';

abstract class SliderRDS {
  Future<void> retriveSliderItems ();
}
class SliderRdsImp implements SliderRDS{
  final ApiConsumer client;

  SliderRdsImp({required this.client});
  @override
  Future<void> retriveSliderItems() async{
    // TODO: implement retriveSliderItems
    // final response =
    // await client.get(path);

    throw UnimplementedError();
  }

}
