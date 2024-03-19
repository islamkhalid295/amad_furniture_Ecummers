import 'package:cedage/core/api/api_consummer.dart';
import 'package:cedage/core/api/end_points.dart';
import '../models/faq_model.dart';

abstract class FaqRDS {
  Future<FaqList> retriveFaq ();
}
class FaqRdsImp implements FaqRDS{
  final ApiConsumer client;

  FaqRdsImp({required this.client});
  @override
  Future<FaqList> retriveFaq() async{

    final response =
    await client.get("${EndPoints.BASE_URL + EndPoints.GET_FAQ}");
    FaqList faqList = FaqList.fromJson(response);
    print(faqList);
    return faqList;

  }

}
