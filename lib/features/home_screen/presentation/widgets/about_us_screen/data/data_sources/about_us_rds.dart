import 'package:cedage/core/api/api_consummer.dart';
import 'package:cedage/core/api/end_points.dart';

import '../models/about_us_model.dart';


abstract class AboutUsRDS {
  Future<AboutUsModel> retriveAboutUs ();
}
class AboutUsRdsImp implements AboutUsRDS{
  final ApiConsumer client;

  AboutUsRdsImp({required this.client});
  @override
  Future<AboutUsModel> retriveAboutUs() async{

    final response =
    await client.get("${EndPoints.BASE_URL + EndPoints.ABOUT_US}");
    AboutUsModel aboutUsModel = AboutUsModel.fromJson(response);

    return aboutUsModel;

  }

}
