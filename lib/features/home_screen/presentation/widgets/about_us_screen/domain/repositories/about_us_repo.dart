
import '../../data/data_sources/about_us_rds.dart';
import '../../data/models/about_us_model.dart';

abstract class AboutUsRepo {
  Future<AboutUsModel> retriveAboutUs ();
}

class AboutUsRepoImp implements AboutUsRepo{
  final AboutUsRDS aboutUsRDS;

  AboutUsRepoImp({required this.aboutUsRDS});
  @override
  Future<AboutUsModel> retriveAboutUs() async {
     return await aboutUsRDS.retriveAboutUs();
  }

}