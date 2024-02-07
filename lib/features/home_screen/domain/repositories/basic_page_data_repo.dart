import '../../data/data_sources/basic_page_data_rds.dart';
import '../../data/models/basic_data_model.dart';

abstract class BasicDataRepo {
  Future<BasicDataModel> getBasicData ();
}

class BasicDataRepoImp implements BasicDataRepo{
  final BasicDataRDS basicDataRDS;

  BasicDataRepoImp({required this.basicDataRDS});
  @override
  Future<BasicDataModel> getBasicData() async {
     return await basicDataRDS.getBasicData();
  }

}