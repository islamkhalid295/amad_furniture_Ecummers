import 'package:amad_furniture/core/api/api_consummer.dart';
import 'package:amad_furniture/core/api/end_points.dart';

import '../models/basic_data_model.dart';



abstract class BasicDataRDS {
  Future<BasicDataModel> getBasicData ();
}
class BasicDataRdsImp implements BasicDataRDS{
  final ApiConsumer client;

  BasicDataRdsImp({required this.client});
  @override
  Future<BasicDataModel> getBasicData() async{

    final response =
    await client.get("${EndPoints.BASE_URL + EndPoints.GET_BASIC_DATA}");
    BasicDataModel basicDataModel = BasicDataModel.fromJson(response);

    return basicDataModel;

    throw UnimplementedError();
  }

}
